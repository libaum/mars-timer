#!/usr/bin/env bash
set -euo pipefail
# Build, install and run the RELEASE build of Mars Timer via `flutter run`.
#   applicationId: com.catchingclouds.marstimer  (release-signed)
# Requires the release keystore (android/key.properties) to be configured.
# No hot reload in release mode. Extra args are passed through,
# e.g. ./run_release.sh -d <device-id>.

cd "$(dirname "$0")"

if [ -z "$(adb devices | sed '1d' | grep -w device || true)" ]; then
  echo "No device connected (check 'adb devices')." >&2
  exit 1
fi

echo "==> flutter run (release)"
exec flutter run --release "$@"
