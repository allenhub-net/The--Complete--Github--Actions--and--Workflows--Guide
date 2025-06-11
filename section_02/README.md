# Section 2 - Events

[Udemy Course Link](https://www.udemy.com/share/102DqF3@2HGIM2z2VoQAKmZTdGdGTqxk019uYQvvPTloZt5Ss8noJMBI7eT51ozLMdESC0TC/)

<!-- markdownlint-disable -->
<!--ts-->
* [Section 2 - Events](#section-2---events)
   * [Section 2.15 - Events](#section-215---events)
      * [push](#push)
      * [pull_request](#pull_request)
      * [issue create:](#issue-create)
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
