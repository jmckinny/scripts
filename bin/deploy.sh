#!/bin/bash
set -eu

cd "$(dirname "$0")"

USER_BIN="$HOME/bin"
if [ ! -d "$USER_BIN" ]; then
  echo "No user bin found"
  exit 1
fi

for file in *; do
  if [ "$file" == "deploy.sh" ]; then
    continue
  fi

  NEW_FILENAME="${file%.*}"
  NEW_PATH="$USER_BIN/$NEW_FILENAME"

  if [ "$NEW_PATH" -nt "$file" ]; then
    # If deployed version is already up to date
    echo "Up to date: $file"
    continue
  fi

  echo "Deployed: $file"
  cp "$file" "$NEW_PATH"

done

echo "All scripts deployed to $USER_BIN"
