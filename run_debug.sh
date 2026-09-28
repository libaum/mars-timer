#!/usr/bin/env bash
# Debug-Build per flutter run (Hot Reload).
exec app "$(dirname "$0")" run "$@"
