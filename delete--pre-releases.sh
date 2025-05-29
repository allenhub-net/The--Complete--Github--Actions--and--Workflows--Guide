#!/bin/bash
# filepath: /workspaces/The--Complete--Github--Actions--and--Workflows--Guide/delete--pre-releases.sh

# Check for force flag
FORCE=0
if [[ "$1" == "-f" || "$1" == "--force" ]]; then
    FORCE=1
fi

# Get all releases (including pre-releases) as a JSON array
releases=$(gh release list --limit 1000 --json tagName,isPrerelease)

# Loop through pre-releases
echo "$releases" | jq -c '.[] | select(.isPrerelease == true)' | while read -r prerelease; do
    tag=$(echo "$prerelease" | jq -r '.tagName')
    # Extract base tag (e.g., v1.6.0 from v1.6.0-section--01.1)
    base_tag=$(echo "$tag" | sed -E 's/-section--.*//')
    # Check if base release exists and is not a pre-release
    echo "Checking pre-release: $tag (base release: $base_tag)"

    if echo "$releases" | jq -e --arg base "$base_tag" '[.[] | select(.tagName == $base and .isPrerelease == false)] | length > 0' > /dev/null; then
        if [[ "$FORCE" -eq 1 ]]; then
            echo "Deleting pre-release: $tag (base release $base_tag exists)"
            gh release delete "$tag" --yes
            echo "[DRY RUN] Would delete pre-release: $tag (base release $base_tag exists)"
            echo "[DRY RUN] Would delete tag: $tag"
        fi
    fi
done