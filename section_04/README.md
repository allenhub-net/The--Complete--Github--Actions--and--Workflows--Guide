# Section 4 - Advanced GitHub Actions Features

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Section 4 - Advanced GitHub Actions Features](#section-4---advanced-github-actions-features)
   * [Section 4.32 - Timeout and Continue](#section-432---timeout-and-continue)
      * [continue-on-error](#continue-on-error)
      * [timeout-minutes](#timeout-minutes)
   * [Section 4.33 - matrix](#section-433---matrix)
   * [Section 4.34 - Including and Excluding Matrix Configurations](#section-434---including-and-excluding-matrix-configurations)
   * [Section 4.35 - Handling Failing Jobs in Matrix](#section-435---handling-failing-jobs-in-matrix)
   * [Section 4.36 - Outputs and Dynamic Matrices](#section-436---outputs-and-dynamic-matrices)
   * [Section 4.37 - Concurrency](#section-437---concurrency)
   * [Section 4.38 - Reusable Workflows](#section-438---reusable-workflows)
<!--te-->
<!-- markdownlint-enable MD007 -->

## Section 4.32 - Timeout and Continue

### continue-on-error

```bash
continue-on-error: true
```

### timeout-minutes

note: if timeout at job level, timeout produces `cancelled` instead of error (failure?)

```bash
timeout-minutes: 1
```

## Section 4.33 - matrix

job-level `continue-on-error: true` do different things

`continue-on-error: true` prevent workflow from failing if a job in our matrix fails.  Think _continue processing jobs as if no error ocurred_.

`fail-fast: false` prevent github from cancelling pending and in-progress jobs if a job in our matrix fails

cool: ran a 5x2 matrix (10 jobs) with  `max-parallel: 3`.  put Node v15 on MacOS at the top so it ran early.  Three jobs in parallel, one of the first three being Node v15 on MacOS.  

| `fail-fast` | `continue-on-error` | post-failure jobs | workflow |
|-------------|---------------------|-------------------|----------|
| `false`     |    `false`          | run               | fail     |
| `false`     |    `true`           | run               | success  |
| `true`      |    `false`          | cancelled         | fail     |
| `true`      |    `true`           | run               | success  |

hmmm:  downstream jobs are cancelled only when `fail-fast: true` and `continue-on-error: false`.

## Section 4.34 - Including and Excluding Matrix Configurations

n/a

## Section 4.35 - Handling Failing Jobs in Matrix

[Section 4.33 - matrix](#section-433---matrix)

cool - works as designed.  see `os: macos-latest` `node-version: 15`

## Section 4.36 - Outputs and Dynamic Matrices

turned off macos, as 10x the cost of linux, and blew my budget of free account

## Section 4.37 - Concurrency

key concurrency groups off `environment:`

## Section 4.38 - Reusable Workflows

use actions in `steps:`

for reusable workflows, the called workflow is the entire job

See notes for renovating reusable workflows [Update Reusable Workflows](../doc/renovatebot/README.md#update-reusable-workflows).