# Section 4 - Advanced GitHub Actions Features

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Section 4 - Advanced GitHub Actions Features](#section-4---advanced-github-actions-features)
   * [Section 4.33 - Timeout and Continue](#section-433---timeout-and-continue)
      * [continue-on-error](#continue-on-error)
      * [timeout-minutes](#timeout-minutes)
   * [Section 4.34 - matrix](#section-434---matrix)
<!--te-->
<!-- markdownlint-enable MD007 -->

## Section 4.33 - Timeout and Continue

### continue-on-error

```bash
continue-on-error: true
```

### timeout-minutes

note: if timeout at job level, timeout produces `cancelled` instead of error (failure?)

```bash
timeout-minutes: 1
```

## Section 4.34 - matrix

job-level `continue-on-error: true` do different things

`continue-on-error: true` prevent workflow from failing if a job in our matrix fails.  Think _continue processing jobs as if no error ocurred_.

`fail-fast: false` prevent github from cancelling pending and in-progress jobs if a job in our matrix fails

cool: ran a 5x2 matrix (10 jobs) with  `max-parallel: 3`.  put Node v15 on MacOS at the top so it ran early.  Three jobs in parallel, one of the first three being Node v15 on MacOS.  


| `fail-fast` | `continue-on-error` | post-failure jobs | workflow |
|-------------|---------------------|-------------------|----------|
| `false`     |    `false`          | run               | fail     |
| `false`     |    `true`           | run               | success  |
| `true`      |    `false`          | cancelled         | fail     |
| `true`      |    `true`           |                             |                        |


Failed as expected and no more jobs started.  All "downstream" jobs marked as cancelled.

`fail-fast: true` and

don't fail fast #37
🟢