#!/usr/bin/env bash
set -euo pipefail
# Build, install and ATTACH the DEBUG build of Mars Timer via `flutter run`.
#   applicationId: com.catchingclouds.marstimer.debug
# Gives you hot reload (r) / hot restart (R). Extra args are passed through,
# e.g. ./run_debug.sh -d <device-id>.

cd "$(dirname "$0")"

if [ -z "$(adb devices | sed '1d' | grep -w device || true)" ]; then
  echo "No device connected (check 'adb devices')." >&2
  exit 1
fi

echo "==> flutter run (debug)"
exec flutter run --debug "$@"
