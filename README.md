# The--Complete--Github--Actions--and--Workflows--Guide

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable -->
<!--ts-->

* [The--Complete--Github--Actions--and--Workflows--Guide](README.md#the--complete--github--actions--and--workflows--guide)
   * [renovate notes](README.md#renovate-notes)
      * [create PRs in github not renovate console](README.md#create-prs-in-github-not-renovate-console)
      * [Commit message](README.md#commit-message)
         * [Default message](README.md#default-message)
         * [Pull Request Title](README.md#pull-request-title)
         * [🏆 WINNER 🏆 PR Title and description](README.md#-winner--pr-title-and-description)
   * [EKS Notes](README.md#eks-notes)
   * [Mermaid](README.md#mermaid)

* [Section 1 - Basic Concepts](section_01/README.md#section-1---basic-concepts)
   * [Section 1.3 - YAML](section_01/README.md#section-13---yaml)
   * [Section 1.4 - First Workflow](section_01/README.md#section-14---first-workflow)
   * [Section 1.5 - Parallel &amp; Dependent Jobs](section_01/README.md#section-15---parallel--dependent-jobs)
   * [Section 1.6 - Managing Workflows](section_01/README.md#section-16---managing-workflows)
   * [Section 1.7 - Debugging Workflows](section_01/README.md#section-17---debugging-workflows)
   * [Section 1.8 - Skipping Workflows](section_01/README.md#section-18---skipping-workflows)
   * [Section 1.9 - Workflow commands](section_01/README.md#section-19---workflow-commands)
   * [Section 1.11 - Working Dirs and Shells](section_01/README.md#section-111---working-dirs-and-shells)
   * [Section 1.12 - Download our repo](section_01/README.md#section-112---download-our-repo)
   * [Section 1.13 - Actions](section_01/README.md#section-113---actions)
   * [Section 1.14 - Actions](section_01/README.md#section-114---actions)

* [Section 2 - Events](section_02/README.md#section-2---events)
   * [Section 2.15 - Events](section_02/README.md#section-215---events)
      * [push](section_02/README.md#push)
      * [pull_request](section_02/README.md#pull_request)
         * [pull request creation](section_02/README.md#pull-request-creation)
         * [pull request merge](section_02/README.md#pull-request-merge)
      * [issue create](section_02/README.md#issue-create)
   * [Section 2.16 - Event Activity Types](section_02/README.md#section-216---event-activity-types)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!--te-->

<!-- markdownlint-enable -->

## renovate notes

### create PRs in github not renovate console

🦠 renovate web service by default will create the dependency dashboard in the
 web console (the "developer console"), and not in a github issue.
  I found it difficult to find this setting based on naming.

"Silent Mode" seems to be the culprait, as least as far as naming clarity is concerned.

1. go to "SETTINGS"  
   ![Mend Renovate Settings](resources/mend-renovate-settings.png)

1. Selection "Dependencies"

1. Configure

   ![Renovate Config Example](resources/renovate-config.png)

   * ✅ Dependency Updates
   * ❌ Silent Mode
   * Renovate
     * ✅ Automated PRs
     * ✅ Require config file
     * ✅ Create onboarding PRs

### Commit message

![PR Settings](resources/pr-settings.png)

#### Default message

doesn't trigger semantic release the
way I want

#### Pull Request Title

seems good

#### 🏆 WINNER 🏆 PR Title and description

includes the branch and (clickable) PR number in the commit summary

## EKS Notes

<https://docs.renovatebot.com/modules/versioning/aws-eks-addon/>

## Mermaid

```mermaid

%% Repository Structure
graph TD;
    ROOT["/ (root)"]
    ROOT --> CHANGELOGMD["CHANGELOG.md"]
    ROOT --> MAKEFILE["Makefile"]
    ROOT --> READMEMD["README.md"]
    ROOT --> APPJS["app.js"]
    ROOT --> DERENOVATESH["de-renovate.sh"]
    ROOT --> PACKAGELOCKJSON["package-lock.json"]
    ROOT --> PACKAGEJSON["package.json"]
    ROOT --> RESOURCES["resources/"]
    RESOURCES --> RESOURCES_MENDRENOVATESETTINGSPNG["mend-renovate-settings.png"]
    RESOURCES --> RESOURCES_PRSETTINGSPNG["pr-settings.png"]
    RESOURCES --> RESOURCES_RENOVATECONFIGPNG["renovate-config.png"]
    ROOT --> SECTION_01["section_01/"]
    SECTION_01 --> SECTION_01_READMEMD["README.md"]
    SECTION_01 --> SECTION_01_CONVERTJS["convert.js"]
    SECTION_01 --> SECTION_01_INPUTYAML["input.yaml"]
    SECTION_01 --> SECTION_01_OUTPUTJSON["output.json"]
    SECTION_01 --> SECTION_01_PACKAGELOCKJSON["package-lock.json"]
    SECTION_01 --> SECTION_01_PACKAGEJSON["package.json"]
    ROOT --> SECTION_02["section_02/"]
    SECTION_02 --> SECTION_02_READMEMD["README.md"]
    ROOT --> UPDATEMERMAIDGRAPHJS["update-mermaid-graph.js"]
```
