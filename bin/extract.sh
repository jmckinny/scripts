#!/usr/bin/env bash

set -eu

FILE_NAME="$1"

if [ -z "$FILE_NAME" ]; then
  echo "Usage: extract <file_name>"
  exit 1
fi

case "$FILE_NAME" in
    *.tar.gz|*.tgz) tar xf "$FILE_NAME" && rm "$FILE_NAME" ;;
    *.zip) unzip "$FILE_NAME" && rm "$FILE_NAME" ;;
    *) echo "Unkown file extension $FILE_NAME" ;;
esac


