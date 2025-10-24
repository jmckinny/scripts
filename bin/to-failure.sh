#!/usr/bin/env bash

TIMEOUT=1

"$@"
while [[ "$?" -eq 0 ]]; do
  sleep "$TIMEOUT"
  "$@"
done
