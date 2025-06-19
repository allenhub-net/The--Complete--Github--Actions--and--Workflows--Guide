# Section 1 - Basic Concepts

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Section 1 - Basic Concepts](#section-1---basic-concepts)
   * [Section 1.3 - YAML](#section-13---yaml)
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
<!--te-->
<!-- markdownlint-enable MD007 -->

## Section 1.3 - YAML

align vscode panels

* top-left: input.yaml
* top-right: output.json
* bottom: terminal

in terminal

    npm install 

    npm run start

change something in _input.yaml_  
see convert.js restart in terminal  
see output.json updated in _output.json_  

## Section 1.4 - First Workflow

<!-- markdownlint-disable MD033 -->
<ul>
</ul>
<!-- markdownlint-enable MD033 -->

## Section 1.5 - Parallel & Dependent Jobs
<!-- markdownlint-disable MD033 -->
<ul>
</ul>
<!-- markdownlint-enable MD033 -->

## Section 1.6 - Managing Workflows

* debug logging when re-running single jobs

## Section 1.7 - Debugging Workflows

* highlight a line in an action and copy/paste the URL

  [github token permission](https://github.com/allenhub-net/The--Complete--Github--Actions--and--Workflows--Guide/actions/runs/15276653619/job/42964625517#step:1:17)

* repsitory variables for debugging

      ACTIONS_RUNNER_DEBUG=true
      ACTIONS_STEP_DEBUG=true

  note: github actions extensions for codespace does not seem
  to integrate with "settings" frame

  note: releases for ss1.7 are coming out as "pre-release" :(
Wed May 28 13:52:44 UTC 2025

## Section 1.8 - Skipping Workflows

* `[skip ci]`, `[skip actions]`

## Section 1.9 - Workflow commands

* message to runner - cool
* whoa ... there are many of them <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions>
* cool - folding/grouping messages
* cool - masking

## Section 1.11 - Working Dirs and Shells

* workflow, job, or step-level setting of shell or wd
* python shell
  * command body is python code :)

## Section 1.12 - Download our repo

* no school like old school
* github variables

## Section 1.13 - Actions

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

## Section 1.14 - Actions

mostly fiddling with renovate, which is awesome
