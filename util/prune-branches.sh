#!/bin/bash
# Prune local branches that have been merged, except main/master,
# and prune remote-tracking branches.

set -euo pipefail

readonly EXCLUDE_BRANCHES='(^\*|main|master)'

git branch --merged \
  | grep --invert-match --extended-regexp "${EXCLUDE_BRANCHES}" \
  | xargs --no-run-if-empty --max-args=1 git branch --delete

git remote prune origin