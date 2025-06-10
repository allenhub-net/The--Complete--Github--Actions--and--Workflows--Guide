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
