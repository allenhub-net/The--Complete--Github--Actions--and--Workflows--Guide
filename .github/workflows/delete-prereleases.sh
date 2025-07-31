#!/bin/bash
# filepath: /workspaces/The--Complete--Github--Actions--and--Workflows--Guide/delete--pre-releases.sh

# Check for dryrun flag
DRYRUN=1
if [[ "$1" == "-w" || "$1" == "--wet-run" ]]; then
    DRYRUN=0
fi

# Get all releases (including pre-releases) as a JSON array
releases=$(gh release list --limit 1000 --json tagName,isPrerelease)

num_prereleases=$(echo "$releases" | jq -c '.[] | select(.isPrerelease == true)' | wc -l)
if [[ "$num_prereleases" -eq 0 ]]; then
    echo "No pre-releases found."
    echo "::notice title=No pre-releases found::No pre-releases found."
    exit 0
else
    echo "Found $num_prereleases pre-releases."
    echo "::notice title=Found pre-releases::Found $num_prereleases pre-releases."
fi

# Loop through pre-releases
echo "$releases" | jq -c '.[] | select(.isPrerelease == true)' | while read -r prerelease; do
    tag=$(echo "$prerelease" | jq -r '.tagName')
    # Extract base tag (e.g., v1.6.0 from v1.6.0-section--01.1)
    base_tag=$(echo "$tag" | sed -E 's/-main.[0-9]+//')
    echo "Checking pre-release: $tag (base release: $base_tag)"

    if echo "$releases" | jq -e --arg base "$base_tag" '[.[] | select(.tagName == $base and .isPrerelease == false)] | length > 0' >/dev/null; then
        if [[ "$DRYRUN" -eq 0 ]]; then
            echo "  Deleting pre-release: $tag (base release $base_tag exists)"
            echo "::notice title=Deleting pre-release: $tag::Deleting pre-release: $tag (base release $base_tag exists)"

            gh release delete "$tag" --yes 2>&1 | sed 's/^/    /'
            git push --delete origin "$tag" 2>&1 | sed 's/^/    /'
            git tag -d "$tag" 2>&1 | sed 's/^/    /'
        else
            echo "    [DRY RUN] Would delete pre-release: $tag (base release $base_tag exists)"
            echo "    [DRY RUN] Would delete tag: $tag"
        fi
    else
        echo "    Skipping pre-release: $tag (base release $base_tag does not exist or is a pre-release)"
    fi
done
