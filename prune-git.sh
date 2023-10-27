#!/bin/bash
set -eu
IMPORTANT_BRANCHES='main|develop|master'
CURRENT_BRANCH=$(git branch --show-current | sed 's/^*/ /')

if echo "$CURRENT_BRANCH" | grep -qvE $IMPORTANT_BRANCHES; then
    read -r -p "Are you sure you want to prune on branch '$CURRENT_BRANCH'? [y/N] " response
    if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then 
        echo "Aborting"
        exit 1
    fi
fi

git branch --merged | sed 's/^*/ /' | grep -vE $IMPORTANT_BRANCHES >/tmp/merged-branches && \
    $EDITOR /tmp/merged-branches && xargs git branch -d </tmp/merged-branches

