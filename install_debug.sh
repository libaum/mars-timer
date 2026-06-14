#!/usr/bin/env bash
set -euo pipefail
# Build and install the DEBUG build of Mars Timer on a connected device.
#   applicationId: com.catchingclouds.marstimer.debug
# Installs side by side with the release build — they have different IDs.

cd "$(dirname "$0")"

PKG="com.catchingclouds.marstimer.debug"
APK="build/app/outputs/flutter-apk/app-debug.apk"

if [ -z "$(adb devices | sed '1d' | grep -w device || true)" ]; then
  echo "No device connected (check 'adb devices')." >&2
  exit 1
fi

# Install, keeping data. On a signature mismatch offer to uninstall and reinstall.
install_apk() {
  local pkg="$1" apk="$2" out
  if out=$(adb install -r "$apk" 2>&1); then
    echo "$out"; return 0
  fi
  echo "$out" >&2
  if echo "$out" | grep -q "signatures do not match\|INSTALL_FAILED_UPDATE_INCOMPATIBLE"; then
    echo >&2
    echo "'$pkg' is already installed with a different signature." >&2
    read -r -p "Uninstall it and reinstall? This erases its local data [y/N] " ans
    if [[ "$ans" =~ ^[Yy]$ ]]; then
      adb uninstall "$pkg"
      adb install "$apk"
    else
      echo "Aborted." >&2; return 1
    fi
  else
    return 1
  fi
}

echo "==> Building debug APK"
flutter build apk --debug

echo "==> Installing $APK"
install_apk "$PKG" "$APK"

echo "==> Launching $PKG"
adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1 || true

echo "Done."
