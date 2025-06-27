# Semantic Release

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Semantic Release](#semantic-release)
   * [What Actually Triggers a Semantic Release](#what-actually-triggers-a-semantic-release)
<!--te-->
<!-- markdownlint-enable MD007 -->

## What Actually Triggers a Semantic Release

[From: _Section 03 README - Configuration Variables and Secrets_](../../section_03/README.md#configuration-variables-and-secrets)


semantic release is being a pain

test1: no feat: commits, but feat: in the PR
result: no release

test2: feat: in commit

final results: it matters what is in the commit - it doesn't matter what's in the PR message