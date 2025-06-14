#!/bin/bash

set -e
set -u

REPO="allenhub-net/The--Complete--Github--Actions--and--Workflows--Guide"

echo "Checking protection status of all branches in $REPO..."
echo

# Get list of all branches
gh api repos/$REPO/branches --paginate --jq '.[] | .name' | while read branch; do
  is_protected=$(gh api repos/$REPO/branches/$branch --jq '.protected')
  echo "Branch: $branch    Protected: $is_protected"
done

#EOF
