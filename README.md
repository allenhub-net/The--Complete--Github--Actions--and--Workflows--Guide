# The--Complete--Github--Actions--and--Workflows--Guide

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable -->
# Table of Contents
<!--ts-->
* [The--Complete--Github--Actions--and--Workflows--Guide](#the--complete--github--actions--and--workflows--guide)
* [Table of Contents](#table-of-contents)
   * [<a href="./section_01/README.md">Section 01</a>](./section_01/README.md)
      * [Section 1.4 - First Workflow](#section-14---first-workflow)
      * [Section 1.5 - Parallel &amp; Dependent Jobs](#section-15---parallel--dependent-jobs)
      * [Section 1.6 - Managing Workflows](#section-16---managing-workflows)
      * [Section 1.7 - Debugging Workflows](#section-17---debugging-workflows)
      * [Section 1.8 - Skipping Workflows](#section-18---skipping-workflows)
      * [Section 1.9 - Workflow commands](#section-19---workflow-commands)
      * [Section 1.11 - Working Dirs and Shells](#section-111---working-dirs-and-shells)
      * [Section 1.12 - Download our repo](#section-112---download-our-repo)
      * [Section 1.13 - Actions](#section-113---actions)
      * [Section 1.14 - Actions](#section-114---actions)
* [renovate notes](#renovate-notes)
   * [create PRs in github not renovate console](#create-prs-in-github-not-renovate-console)
   * [Commit message](#commit-message)
      * [Default message](#default-message)
      * [Pull Request Title](#pull-request-title)
      * [🏆 WINNER 🏆 PR Title and description](#-winner--pr-title-and-description)
* [EKS Notes](#eks-notes)
<!--te-->
<!-- markdownlint-enable -->

## [Section 01](./section_01/README.md)

### Section 1.4 - First Workflow

<!-- markdownlint-disable MD033 -->
<ul>
</ul>
<!-- markdownlint-enable MD033 -->

### Section 1.5 - Parallel & Dependent Jobs
<!-- markdownlint-disable MD033 -->
<ul>
</ul>
<!-- markdownlint-enable MD033 -->

### Section 1.6 - Managing Workflows

* debug logging when re-running single jobs

### Section 1.7 - Debugging Workflows

* highlight a line in an action and copy/paste the URL

  [github token permission](https://github.com/allenhub-net/The--Complete--Github--Actions--and--Workflows--Guide/actions/runs/15276653619/job/42964625517#step:1:17)

* repsitory variables for debugging

      ACTIONS_RUNNER_DEBUG=true
      ACTIONS_STEP_DEBUG=true

  note: github actions extensions for codespace does not seem
  to integrate with "settings" frame

  note: releases for ss1.7 are coming out as "pre-release" :(
Wed May 28 13:52:44 UTC 2025

### Section 1.8 - Skipping Workflows

* `[skip ci]`, `[skip actions]`

### Section 1.9 - Workflow commands

* message to runner - cool
* whoa ... there are many of them <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions>
* cool - folding/grouping messages
* cool - masking

### Section 1.11 - Working Dirs and Shells

* workflow, job, or step-level setting of shell or wd
* python shell
  * command body is python code :)

### Section 1.12 - Download our repo

* no school like old school
* github variables

### Section 1.13 - Actions

* three types of actions
  * javascript
    * directly on runner
    * all OSs
  * docker
    * write in any language
    * abstract tools and OS & environment
    * slower than js actions
    * composite actions
      * combine multiple workflow steps into actions
      * reference the action rather than type out the steps

### Section 1.14 - Actions

mostly fiddling with renovate, which is awesome

## Section 2 - Events

push test to see what's active


# renovate notes

## create PRs in github not renovate console

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

## Commit message

<img src="resources/pr-settings.png" alt="PR Settings" width="50%" />

### Default message

doesn't trigger semantic release the
way I want

### Pull Request Title

seems good

### 🏆 WINNER 🏆 PR Title and description

includes the branch and (clickable) PR number in the commit summary

# EKS Notes

<https://docs.renovatebot.com/modules/versioning/aws-eks-addon/>
