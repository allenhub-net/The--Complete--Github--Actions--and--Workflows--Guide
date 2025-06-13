# Section 2 - Events

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable -->
<!--ts-->
- [Section 2 - Events](#section-2---events)
  - [Section 2.15 - Events](#section-215---events)
    - [push](#push)
    - [pull\_request](#pull_request)
      - [pull request creation](#pull-request-creation)
      - [pull request merge](#pull-request-merge)
    - [issue create](#issue-create)
  - [Section 2.16 - Event Activity Types](#section-216---event-activity-types)
  - [section 2.17 - Event trigging from forks](#section-217---event-trigging-from-forks)
  - [section 2.18 - Pull Request Target event](#section-218---pull-request-target-event)
  - [section 2.19 - workflow\_run](#section-219---workflow_run)
  - [section 2.20 - filter workflow runs by branches, tags, paths](#section-220---filter-workflow-runs-by-branches-tags-paths)
    - [copilot: Branch Filter Patterns in GitHub Actions](#copilot-branch-filter-patterns-in-github-actions)
      - [Q: `*` vs `**`](#q--vs-)
      - [A: don't cross `/`, or do cross `/`](#a-dont-cross--or-do-cross-)
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

## section 2.18 - Pull Request Target event

`pull_request_target` - runs in context of base branch, not HEAD branch

safe against protection from external pull requests - does not run the code from
the pull request

such as adding a label

[Octokit REST.js v22 Documentation](https://octokit.github.io/rest.js/v22/)

## section 2.19 - workflow_run

note: can only have up to three levels of nesting for `workflow_run`

[Setting a default shell and working directory](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/setting-a-default-shell-and-working-directory)

## section 2.20 - filter workflow runs by branches, tags, paths

* branches - established (see semantic release and pre-release)

  * `*` does not match `/`

  * `**` matches across `/`s
  
### copilot: Branch Filter Patterns in GitHub Actions

#### Q: `*` vs `**`

_In GitHub Actions workflow event branch filters, please explain '*' and '**',  
and highlight what is different about them_

#### A: don't cross `/`, or do cross `/`

In GitHub Actions workflow event branch filters, `*` and `**` are glob patterns
used to match branch names.

* `*` (single asterisk):  
  Matches any sequence of characters **except the path separator** (`/`).  
  * Example:  
    * Pattern: `feature/*`  
    * Matches: `feature/one`, `feature/two`  
    * Does **not** match: `feature/one/two`

* `**` (double asterisk):  
  Matches any sequence of characters, **including path separators** (`/`).  
  * Example:  
    * Pattern: `feature/**`  
    * Matches: `feature/one`, `feature/one/two`, `feature/three/four/five`

**Key difference:**  

* `*` matches only within a single path segment (no `/`),

* `**` matches across multiple path segments (can include `/`).

[GitHub Actions Filter Pattern Cheat Sheet](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet)

Note: `branches-ignore`

* also note, `branches` and `branches-ignore` are mutually exclusive

* also, also note: `"!feature/featA"` ignores `feature/featA`
