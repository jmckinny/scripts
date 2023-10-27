#!/bin/bash
set -eu

cd "$(dirname "$0")"

USER_BIN="$HOME/bin"
if [ ! -d "$USER_BIN" ]; then
    echo "No user bin found"
    exit 1
fi

for file in *.sh; do
    if [ "$file" == "deploy.sh" ]; then
        continue
    fi
    NEW_FILENAME="${file%.sh}"
    cp "$file" "$USER_BIN/$NEW_FILENAME"
done

echo "All scripts deployed to $USER_BIN"