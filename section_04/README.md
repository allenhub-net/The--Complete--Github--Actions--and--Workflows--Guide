# Section 4 - Advanced GitHub Actions Features

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Section 4 - Advanced GitHub Actions Features](#section-4---advanced-github-actions-features)
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
