#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")" && pwd -P)"
out="${1:-$root/build}"
app="$out/Mira iPhone Updates.app"
mkdir -p "$app/Contents/MacOS" "$app/Contents/Resources" "$out/swift-cache"
for arch in arm64 x86_64; do
    xcrun swiftc -parse-as-library -O -target "$arch-apple-macos13.0" -module-cache-path "$out/swift-cache" "$root/UpdateFeed.swift" "$root/MiraPhoneUpdates.swift" -o "$out/MiraPhoneUpdates-$arch"
done
xcrun lipo -create "$out/MiraPhoneUpdates-arm64" "$out/MiraPhoneUpdates-x86_64" -output "$app/Contents/MacOS/MiraPhoneUpdates"
cp "$root/Info.plist" "$app/Contents/Info.plist"
cp "$root/Mira.icns" "$app/Contents/Resources/Mira.icns"
codesign --force --sign - "$app"
codesign --verify --strict "$app"
