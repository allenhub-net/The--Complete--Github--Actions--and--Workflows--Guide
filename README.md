# The--Complete--Github--Actions--and--Workflows--Guide

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

[GitHub Actions Workflow Documentation](https://docs.github.com/en/actions/writing-workflows)

<!-- markdownlint-disable -->
<!--ts-->


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
   * [section 2.17 - Event trigging from forks](section_02/README.md#section-217---event-trigging-from-forks)
   * [section 2.18 - Pull Request Target event](section_02/README.md#section-218---pull-request-target-event)
   * [section 2.19 - workflow_run](section_02/README.md#section-219---workflow_run)
   * [section 2.20 - filter workflow runs by branches, tags, paths](section_02/README.md#section-220---filter-workflow-runs-by-branches-tags-paths)
      * [copilot: Branch Filter Patterns in GitHub Actions](section_02/README.md#copilot-branch-filter-patterns-in-github-actions)
         * [Q: * vs **](section_02/README.md#q--vs-)
         * [A: don't cross /, or do cross /](section_02/README.md#a-dont-cross--or-do-cross-)
   * [section 2.21 - manual trigger](section_02/README.md#section-221---manual-trigger)
      * [cool - postman](section_02/README.md#cool---postman)
   * [section 2.22 - repository dispatch](section_02/README.md#section-222---repository-dispatch)
   * [section 2.23 - scheduled event](section_02/README.md#section-223---scheduled-event)

* [Section 3 - Expressions, Contexts, Etc](section_03/README.md#section-3---expressions-contexts-etc)
   * [Section 3.24 - Expressions and Contexts](section_03/README.md#section-324---expressions-and-contexts)
   * [Section 3.25 - If Key](section_03/README.md#section-325---if-key)
   * [Section 3.26 - Status Checks](section_03/README.md#section-326---status-checks)
   * [Section 3.27 - Environment Variables](section_03/README.md#section-327---environment-variables)
   * [Section 3.28 - Dynamic Variables](section_03/README.md#section-328---dynamic-variables)
   * [Section 3.29 - Configuration Variables and Secrets](section_03/README.md#section-329---configuration-variables-and-secrets)
   * [Section 3.30 - Encrypting and Decrypting Large Files](section_03/README.md#section-330---encrypting-and-decrypting-large-files)
      * [encrypt](section_03/README.md#encrypt)
      * [decrypt](section_03/README.md#decrypt)
   * [Section 3.31 - GITHUB_TOKEN](section_03/README.md#section-331---github_token)

* [Section 4 - Advanced GitHub Actions Features](section_04/README.md#section-4---advanced-github-actions-features)
   * [Section 4.32 - Timeout and Continue](section_04/README.md#section-432---timeout-and-continue)
      * [continue-on-error](section_04/README.md#continue-on-error)
      * [timeout-minutes](section_04/README.md#timeout-minutes)
   * [Section 4.33 - matrix](section_04/README.md#section-433---matrix)
   * [Section 4.34 - Including and Excluding Matrix Configurations](section_04/README.md#section-434---including-and-excluding-matrix-configurations)
   * [Section 4.35 - Handling Failing Jobs in Matrix](section_04/README.md#section-435---handling-failing-jobs-in-matrix)
   * [Section 4.36 - Outputs and Dynamic Matrices](section_04/README.md#section-436---outputs-and-dynamic-matrices)
   * [Section 4.37 - Concurrency](section_04/README.md#section-437---concurrency)
   * [Section 4.38 - Reusable Workflows](section_04/README.md#section-438---reusable-workflows)
   * [Section 4.39 - Reusable Workflow Outputs](section_04/README.md#section-439---reusable-workflow-outputs)
   * [Section 4.40 - Nesting Reusable Workflows](section_04/README.md#section-440---nesting-reusable-workflows)

* [Actions and Workflows](doc/actions-and-workflows/README.md#actions-and-workflows)
   * [Workflow Run Title](doc/actions-and-workflows/README.md#workflow-run-title)
      * [Q: why does the title of this workflow run show up as "semantic release", and not the commit summary?](doc/actions-and-workflows/README.md#q-why-does-the-title-of-this-workflow-run-show-up-as-semantic-release-and-not-the-commit-summary)
      * [Q: why does the title of this workflow show up at the commit summary and not "github-markdown-toc"](doc/actions-and-workflows/README.md#q-why-does-the-title-of-this-workflow-show-up-at-the-commit-summary-and-not-github-markdown-toc)
      * [Q: what will the title of the workflow run be if the triggering event was "workflow_run"?](doc/actions-and-workflows/README.md#q-what-will-the-title-of-the-workflow-run-be-if-the-triggering-event-was-workflow_run)
   * [Dollar Sign Prefix to a Bash String](doc/actions-and-workflows/README.md#dollar-sign-prefix-to-a-bash-string)
      * [Q: what does this mean? NEW_ENV_HEREDOC=$'foo
bar'](doc/actions-and-workflows/README.md#q-what-does-this-mean-new_env_heredocfoonbar)

* [Codespaces](doc/codespaces/README.md#codespaces)
   * [GitHub Codespaces/VSCode](doc/codespaces/README.md#github-codespacesvscode)
      * [Note VSCode Extensions to Document/Reproduce Codespace](doc/codespaces/README.md#note-vscode-extensions-to-documentreproduce-codespace)
      * [Manual List](doc/codespaces/README.md#manual-list)

* [Dad Jokes](doc/dadjokes/README.md#dad-jokes)
   * [Two Fish in a Tank](doc/dadjokes/README.md#two-fish-in-a-tank)
   * [What Do You Call](doc/dadjokes/README.md#what-do-you-call)
      * [What do you call a girl between two posts?](doc/dadjokes/README.md#what-do-you-call-a-girl-between-two-posts)

* [Dependabot](doc/dependabot/README.md#dependabot)
   * [Stale JS library](doc/dependabot/README.md#stale-js-library)

* [EKS](doc/eks/README.md#eks)
   * [Renovate EKS Addons](doc/eks/README.md#renovate-eks-addons)

* [Git](doc/git/README.md#git)
   * [Rebase Since Branch Point](doc/git/README.md#rebase-since-branch-point)

* [Markdown](doc/markdown/README.md#markdown)
   * [Line Break](doc/markdown/README.md#line-break)
   * [Horizontal Rule](doc/markdown/README.md#horizontal-rule)
   * [Bot Quoting](doc/markdown/README.md#bot-quoting)
   * [Image Links](doc/markdown/README.md#image-links)
      * [Leading <em>bang</em> symbol](doc/markdown/README.md#leading-bang-symbol)
   * [Image resizing](doc/markdown/README.md#image-resizing)
      * [ImageMagick in a Codespace](doc/markdown/README.md#imagemagick-in-a-codespace)
      * [Markdown Using Scaled Image - which is slick](doc/markdown/README.md#markdown-using-scaled-image---which-is-slick)

* [Mermaid](doc/mermaid/README.md#mermaid)
   * [Repository Map](doc/mermaid/README.md#repository-map)

* [Release Flow](doc/release-flow/README.md#release-flow)
   * [References](doc/release-flow/README.md#references)
   * [Diagram Release Flow](doc/release-flow/README.md#diagram-release-flow)
      * [Q: please diagram "release flow"](doc/release-flow/README.md#q-please-diagram-release-flow)
   * [Release Flow for Udemy](doc/release-flow/README.md#release-flow-for-udemy)
      * [How to Read the Diagram](doc/release-flow/README.md#how-to-read-the-diagram)
      * [Diagram Notes](doc/release-flow/README.md#diagram-notes)
   * [For This Course](doc/release-flow/README.md#for-this-course)
   * [Release Flow Discovery](doc/release-flow/README.md#release-flow-discovery)

* [Renovatebot](doc/renovatebot/README.md#renovatebot)
   * [Create Dependency Dashboard in GitHub not Renovate Console](doc/renovatebot/README.md#create-dependency-dashboard-in-github-not-renovate-console)
   * [Commit Message](doc/renovatebot/README.md#commit-message)
      * [Default Commit Message](doc/renovatebot/README.md#default-commit-message)
      * [Pull Request Title](doc/renovatebot/README.md#pull-request-title)
      * [🏆 WINNER 🏆 PR Title and Description](doc/renovatebot/README.md#-winner--pr-title-and-description)
   * [Update Reusable Workflows](doc/renovatebot/README.md#update-reusable-workflows)
      * [How to make Renovate propose workflow version bumps](doc/renovatebot/README.md#how-to-make-renovate-propose-workflow-version-bumps)

* [Semantic Release](doc/semantic-release/README.md#semantic-release)
   * [What Actually Triggers a Semantic Release](doc/semantic-release/README.md#what-actually-triggers-a-semantic-release)

* [Stuff To Do](doc/todo/README.md#stuff-to-do)
   * [TODO: create a workflow/action that ensures PRs to /main will trigger a semantic release](doc/todo/README.md#todo-create-a-workflowaction-that-ensures-prs-to-main-will-trigger-a-semantic-release)
   * [TODO: figure how a release branch makes sense](doc/todo/README.md#todo-figure-how-a-release-branch-makes-sense)

* [Windows Subsystem for Linux](doc/wsl/README.md#windows-subsystem-for-linux)
   * [References](doc/wsl/README.md#references)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!--te-->

<!-- markdownlint-enable -->
