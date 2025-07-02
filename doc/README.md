# Notes from The--Complete--Github--Actions--and--Workflows--Guide

<!-- markdownlint-disable MD007 -->
<!--ts-->


* [Actions and Workflows](actions-and-workflows/README.md#actions-and-workflows)
   * [Workflow Run Title](actions-and-workflows/README.md#workflow-run-title)
      * [Q: why does the title of this workflow run show up as "semantic release", and not the commit summary?](actions-and-workflows/README.md#q-why-does-the-title-of-this-workflow-run-show-up-as-semantic-release-and-not-the-commit-summary)
      * [Q: why does the title of this workflow show up at the commit summary and not "github-markdown-toc"](actions-and-workflows/README.md#q-why-does-the-title-of-this-workflow-show-up-at-the-commit-summary-and-not-github-markdown-toc)
      * [Q: what will the title of the workflow run be if the triggering event was "workflow_run"?](actions-and-workflows/README.md#q-what-will-the-title-of-the-workflow-run-be-if-the-triggering-event-was-workflow_run)
   * [Dollar Sign Prefix to a Bash String](actions-and-workflows/README.md#dollar-sign-prefix-to-a-bash-string)
      * [Q: what does this mean? NEW_ENV_HEREDOC=$'foo
bar'](actions-and-workflows/README.md#q-what-does-this-mean-new_env_heredocfoonbar)

* [Codespaces](codespaces/README.md#codespaces)
   * [GitHub Codespaces/VSCode](codespaces/README.md#github-codespacesvscode)
      * [Note VSCode Extensions to Document/Reproduce Codespace](codespaces/README.md#note-vscode-extensions-to-documentreproduce-codespace)
      * [Manual List](codespaces/README.md#manual-list)

* [Dependabot](dependabot/README.md#dependabot)
   * [Stale JS library](dependabot/README.md#stale-js-library)

* [EKS](eks/README.md#eks)
   * [Renovate EKS Addons](eks/README.md#renovate-eks-addons)

* [Markdown](markdown/README.md#markdown)
   * [Line Break](markdown/README.md#line-break)
   * [Horizontal Rule](markdown/README.md#horizontal-rule)
   * [Bot Quoting](markdown/README.md#bot-quoting)
   * [Image Links](markdown/README.md#image-links)
      * [Leading <em>bang</em> symbol](markdown/README.md#leading-bang-symbol)
   * [Image resizing](markdown/README.md#image-resizing)
      * [ImageMagick in a Codespace](markdown/README.md#imagemagick-in-a-codespace)
      * [Markdown Using Scaled Image](markdown/README.md#markdown-using-scaled-image)

* [Mermaid](mermaid/README.md#mermaid)
   * [Repository Map](mermaid/README.md#repository-map)

* [Renovatebot](renovatebot/README.md#renovatebot)
   * [Create PRs in GitHub not Renovate Console](renovatebot/README.md#create-prs-in-github-not-renovate-console)
   * [Commit Message](renovatebot/README.md#commit-message)
      * [Default Commit Message](renovatebot/README.md#default-commit-message)
      * [Pull Request Title](renovatebot/README.md#pull-request-title)
      * [🏆 WINNER 🏆 PR Title and Description](renovatebot/README.md#-winner--pr-title-and-description)
   * [Update Reusable Workflows](renovatebot/README.md#update-reusable-workflows)
      * [How to make Renovate propose workflow version bumps](renovatebot/README.md#how-to-make-renovate-propose-workflow-version-bumps)

* [Semantic Release](semantic-release/README.md#semantic-release)
   * [What Actually Triggers a Semantic Release](semantic-release/README.md#what-actually-triggers-a-semantic-release)

* [Stuff To Do](todo/README.md#stuff-to-do)
   * [TODO: create a workflow/action that ensures PRs to /main will trigger a semantic release](todo/README.md#todo-create-a-workflowaction-that-ensures-prs-to-main-will-trigger-a-semantic-release)
   * [TODO: figure how a release branch makes sense](todo/README.md#todo-figure-how-a-release-branch-makes-sense)

* [Windows Subsystem for Linux](wsl/README.md#windows-subsystem-for-linux)
   * [References](wsl/README.md#references)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!--te-->

<!-- markdownlint-enable MD007 -->
