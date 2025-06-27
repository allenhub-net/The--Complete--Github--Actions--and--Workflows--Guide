# Section 4 - Advanced GitHub Actions Features

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Section 4 - Advanced GitHub Actions Features](#section-4---advanced-github-actions-features)
   * [Section 4.33 - Timeout and Continue](#section-433---timeout-and-continue)
      * [continue-on-error](#continue-on-error)
      * [timeout-minutes](#timeout-minutes)
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

`continue-on-error: true` prevent workflow from failing if a job in our matrix fails

`fail-fast: false` prevent github from cancelling pending and in-progress jobs if a job in our matrix fails

