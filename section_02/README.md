# Section 2 - Events

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable -->
<!--ts-->
* [Section 2 - Events](#section-2---events)
   * [Section 2.15 - Events](#section-215---events)
      * [push](#push)
      * [pull_request](#pull_request)
         * [pull request creation](#pull-request-creation)
         * [pull request merge](#pull-request-merge)
      * [issue create](#issue-create)
   * [Section 2.16 - Event Activity Types](#section-216---event-activity-types)
   * [section 2.17 - Event trigging from forks](#section-217---event-trigging-from-forks)
<!--te-->
<!-- markdownlint-enable -->

## Section 2.15 - Events

[GitHub Actions Events Documentation](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows)

### push

```text
GITHUB_SHA:1d6b29137717892bd0558d5f9f93109b6d60fbd2
GITHUB_REF:refs/heads/section--02
```

### pull_request

```text
git switch -c pr-test-branch
edit
commit
```

#### pull request creation

```text
GITHUB_SHA:c43a8f35670b4424cfd6d89bf2e2ca1a5e134a79
GITHUB_REF:refs/pull/58/merge
```

#### pull request merge

```text
GITHUB_SHA:2f1d8f3ba9011e927e9d08fd7b720d4f084d87e6
GITHUB_REF:refs/heads/section--02
```

### issue create

```text
GITHUB_SHA:64c16a8430192b9354084dd0bb77c5221a5817d8
GITHUB_REF:refs/heads/main
```

(ref of last commit on default branch)

## Section 2.16 - Event Activity Types

once again, the workflow file comes from /main.  
maybe later we'll get an alternative to run from the branch doing the push

## section 2.17 - Event trigging from forks

note: lots of settings. if using an organization, settings need to be configured
at organization level

[Approving workflow runs from public forks](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-workflow-runs/approving-workflow-runs-from-public-forks)
