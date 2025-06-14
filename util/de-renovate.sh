#!/bin/bash

set -e
set -u

git pull
git remote prune origin

# Remove all local and remote branches starting with 'renovate/'

# Delete local branches
git branch | grep 'renovate/' | xargs --no-run-if-empty -- git branch --delete --force

# Delete remote branches
git branch --remote | grep 'origin/renovate/' | sed 's|origin/||' | xargs --no-run-if-empty --replace={} echo git push --delete origin {}

#EOF