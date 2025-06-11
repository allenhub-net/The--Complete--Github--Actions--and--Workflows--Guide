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
      * [issue create:](section_02/README.md#issue-create)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!--te-->

<!-- markdownlint-enable -->


## renovate notes

### create PRs in github not renovate console

🦠 renovate web service by default will create the dependency dashboard in the
 web console (the "developer console"), and not in a github issue.
  I found it difficult to find this setting based on naming.

"Silent Mode" seems to be the culprait, as least as far as naming clarity is concerned.

1. go to "SETTINGS" <br>![Mend Renovate Settings](resources/mend-renovate-settings.png)

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

<img src="resources/pr-settings.png" alt="PR Settings" width="50%" />

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

<ul>

```mermaid



%% Repository Structure
graph TD;
    ROOT["/ (root)"]
    ROOT --> GITIGNORE[".gitignore"]
    ROOT --> MARKDOWNLINTIGNORE[".markdownlintignore"]
    ROOT --> RELEASERC[".releaserc"]
    ROOT --> APPJS["app.js"]
    ROOT --> CHANGELOG["CHANGELOG.md"]
    ROOT --> DOT_MARKDOWNLINTIGNORE["dot_markdownlintignore"]
    ROOT --> MAKEFILE["Makefile"]
    ROOT --> README["README.md"]
    ROOT --> GITHUB[".github/"]
    ROOT --> VSCODE[".vscode/"]
    ROOT --> RESOURCES["resources/"]
    ROOT --> SECTION01["section_01/"]
    ROOT --> SECTION02["section_02/"]

    GITHUB --> RENOVATE["renovate.json"]
    GITHUB --> WORKFLOWS["workflows/"]
    WORKFLOWS --> CHECKOUT["checkout.yml"]
    WORKFLOWS --> DELETE_PRERELEASES_SH["delete-prereleases.sh"]
    WORKFLOWS --> DELETE_PRERELEASES_YML["delete-prereleases.yml"]
    WORKFLOWS --> EVENTS["events.yml"]
    WORKFLOWS --> FIRST_WORKFLOW["first_workflow.yml"]
    WORKFLOWS --> GITHUB_MARKDOWN_TOC["github-markdown-toc.yml"]
    WORKFLOWS --> SEMANTIC_PRERELEASE["semantic-prerelease.yml"]
    WORKFLOWS --> SEMANTIC_RELEASE["semantic-release.yml"]
    WORKFLOWS --> SIMPLE_ACTION["simple-action.yml"]
    WORKFLOWS --> WORKFLOW_COMMANDS["workflow-commands.yml"]
    WORKFLOWS --> WORKING_DIRS_SHELLS["working-dirs-and-shells.yml"]

    VSCODE --> SETTINGS["settings.json"]

    RESOURCES --> MEND["mend-renovate-settings.png"]
    RESOURCES --> PR_SETTINGS["pr-settings.png"]
    RESOURCES --> RENOVATE_CONFIG["renovate-config.png"]

    SECTION01 --> CONVERT["convert.js"]
    SECTION01 --> INPUT["input.yaml"]
    SECTION01 --> OUTPUT["output.json"]
    SECTION01 --> PACKAGE["package.json"]
    SECTION01 --> README01["README.md"]

    SECTION02 --> README02["README.md"]
    
    ```
