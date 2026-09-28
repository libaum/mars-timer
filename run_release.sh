#!/usr/bin/env bash
# Release-Build per flutter run (braucht android/key.properties).
exec app "$(dirname "$0")" run --release "$@"
