#!/usr/bin/env bash

TIMEOUT=1

while "$@"; do
  sleep "$TIMEOUT"
done
