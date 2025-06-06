#BOF

# https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile


SHELL := /bin/bash

VENV := venv.tooling

ARGOCD_VERSION     := 2.10.1
EKSCTL_VERSION     := 0.58.0
GITHUBCLI_VERSION  := 2.38.0
HELM_VERSION       := v3.16.0
TERRAFORM_VERSION  := 1.9.7
TERRAGRUNT_VERSION := v0.67.16
VAULT_VERSION      := 1.18.0
GO_VERSION         := 1.23.4


.ONESHELL:

make.targets :
	@echo "available Make targets:"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| egrep -v '^make.default$$' \
	| sed 's/^/    make    /' \
	| env LC_COLLATE=C sort \
	| sed 's/make    maven\.release\./make -n maven.release./' \
	#


make.vars :
	@echo "available variables"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk '/^# makefile/,/^[^#]/ { if ($$1 !~ "^[#.]") {print $$$$1} }' \
	| sed -e 's/ := / !:= /' -e 's/ = / ! = /' \
	| column -t -s'!' \
	| sed 's/  \([:=]\)/\1/' \
	| sed 's/^/    /' \
	| sort


bootstrap : venv.install

therest : bootstrap \
	act.install \
	argocd.install \
	awscliv2.install \
	gh.install \
	go.install \
	hclq.install \
	helm.install \
	krew.install \
	kubectl.install \
	terraform-docs.install \
	terraform.install \
	terragrunt.install \
	vault.install \
	#

installable.list :
	@make make.targets | egrep '[.]install$$' | fgrep    venv.install || true
	@make make.targets | egrep '[.]install$$' | fgrep -v venv.install || true


all versions : bootstrap therest
	@. ${VENV}/bin/activate
	@echo "act:             $$(act --version)"
	@echo "argocd:          $$(argocd version --client | egrep '^argocd:')"
	@echo "aws:             $$(aws --version)"
	@echo "gh:              $$(echo $$(gh  --version))"
	@echo "go:              $$(go version)"
	@echo "hclq:            $$(hclq --version)"
	@echo "helm:            $$(helm version | grep -Po '[^A-Za-z_]Version:\K[^}, ]+' | tr -d '\042')"
	@echo "krew:            $$(kubectl-krew version 2>&1 | awk '/GitTag/ { print $$2 }')"
	@echo "kubectl:         $$(kubectl version --client=true --output=json | jq -r .clientVersion.gitVersion)"
	@echo "python:          $$(python -V)"
	@echo "terraform-docs:  $$(terraform-docs -v)"
	@echo "terraform:       $$(terraform --version --json | jq -r .terraform_version)"
	@echo "terragrunt:      $$(terragrunt --version)"
	@echo "vault:           $$(vault --version  | sed 's/ (.*//')"
	@echo "yq:              $$(yq --version)"


venv.install : ${VENV}/bin/activate

${VENV}/bin/activate :
	python3 -m venv ${VENV}
	. ${VENV}/bin/activate
	pip3 install --upgrade pip
	pip3 install j2cli
	pip3 install pyyaml
	pip3 install wheel
	pip3 install yq
	pip3 freeze



clean :
	find * -name '*~' -exec rm -v {} \;

clean.wicked : clean
	[ -d ${VENV} ] && rm -rf ${VENV} || true


krew.install : bootstrap ${VENV}/bin/kubectl-krew

${VENV}/bin/kubectl-krew : 
	export KREW_ROOT=$$(readlink -f ${VENV}/krew)
	tmpdir="$$(mktemp -t -d krew.XXXXXX)"
	pushd "$${tmpdir}" > /dev/null && pwd
	OS=$$(uname | tr '[:upper:]' '[:lower:]')
	ARCH="$$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$$/arm64/')"
	KREW="krew-$${OS}_$${ARCH}"
	echo KREW_ROOT: $${KREW_ROOT}
	curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/$${KREW}.tar.gz"
	tar zxvf "$${KREW}.tar.gz"
	./"$${KREW}" install krew
	popd > /dev/null && rm -rfv "$${tmpdir}"
	cp -v "${VENV}/krew/bin/kubectl-krew" "${VENV}/bin"
	fgrep 'KREW_ROOT=' "${VENV}/bin/activate" || { echo "export KREW_ROOT=$${KREW_ROOT}" >> "${VENV}/bin/activate" ; }






kubectl.install : bootstrap ${VENV}/bin/kubectl

${VENV}/bin/kubectl : 
	curl -LO "https://dl.k8s.io/release/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&
	curl -LO "https://dl.k8s.io/$$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" &&
	echo "$$(cat kubectl.sha256) kubectl" | sha256sum --check &&
	install -m 0555 kubectl ${VENV}/bin/kubectl &&
	rm -v kubectl kubectl.sha256



terraform-docs.install : bootstrap ${VENV}/bin/terraform-docs

${VENV}/bin/terraform-docs :
	curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-$$(uname)-amd64.tar.gz
	tar -xzf terraform-docs.tar.gz terraform-docs
	chmod +x terraform-docs
	mv terraform-docs ${VENV}/bin/terraform-docs
	rm -v terraform-docs.tar.gz


helm.install : bootstrap ${VENV}/bin/helm

${VENV}/bin/helm :
	[ -d ${VENV}/helm ] || mkdir -pv ${VENV}/helm
	curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xzv --directory ${VENV}/helm linux-amd64/helm
	install ${VENV}/helm/linux-amd64/helm ${VENV}/bin/helm


# terraform
#

terraform.install : bootstrap ${VENV}/bin/terraform

${VENV}/bin/terraform :
	curl --location --remote-name https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
	unzip -B -d ${VENV}/bin/ terraform_${TERRAFORM_VERSION}_linux_amd64.zip
	rm -v terraform_${TERRAFORM_VERSION}_linux_amd64.zip


# terragrunt
#

terragrunt.install : bootstrap ${VENV}/bin/terragrunt

${VENV}/bin/terragrunt :
	curl --location --output ${VENV}/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64
	chmod u+x ${VENV}/bin/terragrunt

awscliv2.install : bootstrap  ${VENV}/aws-cli

${VENV}/aws-cli : ${VENV}/aws
	(cd ${VENV} ; ./aws/install -i $$(pwd)/aws-cli -b $$(pwd)/bin)

${VENV}/aws : ${VENV}/awscliv2.zip
	(cd ${VENV} ; unzip -B -DD -q awscliv2.zip)

${VENV}/awscliv2.zip :
	(cd ${VENV} ; curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip")


hclq.install : bootstrap ${VENV}/bin/hclq

${VENV}/bin/hclq : 
	curl -sSL https://install.hclq.sh | env DESTINATION=${VENV}/bin bash


act.install : ${VENV}/bin/act

${VENV}/bin/act :
	curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | env BINDIR=${VENV}/bin bash
	ls -ld ${VENV}/bin/act


gh.install : bootstrap ${VENV}/bin/gh

${VENV}/bin/gh : 
	(cd ${VENV}/bin ; curl -L https://github.com/cli/cli/releases/download/v${GITHUBCLI_VERSION}/gh_${GITHUBCLI_VERSION}_linux_amd64.tar.gz | tar xfz - --strip-components=2)


go.install : bootstrap ${VENV}/go${GO_VERSION}/go/bin/go

${VENV}/go${GO_VERSION}/go/bin/go : ${VENV}/go${GO_VERSION}.linux-amd64.tar.gz
	rm -rfv ${VENV}/go${GO_VERSION} /local/go${GO_VERSION}
	mkdir -pv ${VENV}/go${GO_VERSION}
	mkdir -pv /local/go${GO_VERSION}/gocache
	mkdir -pv /local/go${GO_VERSION}/gomodcache
	tar -C ${VENV}/go${GO_VERSION} -xvzf ${VENV}/go${GO_VERSION}.linux-amd64.tar.gz
	touch ${VENV}/go${GO_VERSION}/go/bin/go 
	GOBIN=$$(readlink  -f ${VENV}/go${GO_VERSION}/go/bin)
	grep "PATH=.*$${GOBIN}" "${VENV}/bin/activate" || { echo "export PATH=\"$${GOBIN}:\$${PATH}\"" >> "${VENV}/bin/activate" ; }
	fgrep GOCACHE "${VENV}/bin/activate" ||  { echo export GOCACHE=/local/go${GO_VERSION}/gocache >> "${VENV}/bin/activate" ; }
	fgrep GOMODCACHE "${VENV}/bin/activate" || { echo export GOMODCACHE=/local/go${GO_VERSION}/gomodcache >> "${VENV}/bin/activate" ; }


${VENV}/go${GO_VERSION}.linux-amd64.tar.gz : 
	(cd ${VENV} && curl -LO https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz)


argocd.install : bootstrap ${VENV}/bin/argocd

${VENV}/bin/argocd : ${VENV}/argocd-v${ARGOCD_VERSION}-linux-amd64
	cp --verbose --interactive ${VENV}/argocd-v${ARGOCD_VERSION}-linux-amd64 ${VENV}/bin/argocd
	chmod --verbose +x ${VENV}/bin/argocd

${VENV}/argocd-v${ARGOCD_VERSION}-linux-amd64  :
	(cd ${VENV} ; wget https://github.com/argoproj/argo-cd/releases/download/v${ARGOCD_VERSION}/argocd-linux-amd64)
	(cd ${VENV} ; mv --verbose --interactive argocd-linux-amd64 argocd-v${ARGOCD_VERSION}-linux-amd64)



# vault
#

vault.install : bootstrap ${VENV}/bin/vault

${VENV}/bin/vault : ${VENV}/vault_${VAULT_VERSION}_linux_amd64.zip
	[ ${VENV}/vault_${VAULT_VERSION}_linux_amd64.zip -nt ${VENV}/bin/vault ] && { rm -vf ${VENV}/bin/vault ; unzip -B -DD -d ${VENV}/bin ${VENV}/vault_${VAULT_VERSION}_linux_amd64.zip ; }

${VENV}/vault_${VAULT_VERSION}_linux_amd64.zip :
	curl --output-dir ${VENV} --location --remote-name https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip



#EOF


