#!/usr/bin/env bash

TIMEOUT=1

until "$@"; do
  sleep "$TIMEOUT"
done
