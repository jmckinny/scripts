#!/bin/bash
set -eu

cd "$(dirname "$0")"

USER_BIN="$HOME/bin"
if [ ! -d "$USER_BIN" ]; then
  echo "No user bin found"
  exit 1
fi

for file in bin/*; do
  BASE_FILE_NAME=$(basename ${file})
  NEW_FILENAME="${BASE_FILE_NAME%.*}"
  DEPLOY_PATH="$USER_BIN/$NEW_FILENAME"

  if [ "$DEPLOY_PATH" -nt "$file" ]; then
    # If deployed version is already up to date
    echo "Up to date: $BASE_FILE_NAME"
    continue
  fi

  echo "Deployed: $BASE_FILE_NAME"
  cp "$file" "$DEPLOY_PATH"

done

echo "All scripts deployed to $USER_BIN"
