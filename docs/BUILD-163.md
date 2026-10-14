# Mira Mac 0.5.18 — build 163

Low Data on Mac now prefers smaller 1080p sources and hardware-friendly codecs. It can fall back to a lower resolution when suitable 1080p is unavailable. Equivalent candidates are ordered by known file size, with smaller files first. Low Data remains a preference, not a hard data allowance.

Balanced retains its hardware-aware 4K preference and a known-size budget of 30 decimal GB per two hours, scaled to known runtime. Highest continues to prioritize resolution and original-quality disc sources. Choices rely on provider metadata, not a measurement of the actual picture or internet speed.

The Settings footer now displays the desktop version rather than the old shared base version. Playback settings, accounts, add-ons and library are preserved.

Both Apple Silicon and Intel packages require macOS 12 or newer. These are Release packages, ad-hoc signed and not Apple-notarized.

80 targeted Mac checks passed. iPhone 161 and Fire TV 162 retain their current binaries and behavior. Full source, a checked patch, checksums and validation notes are included.

# Mac build 163 validation

- 80 targeted tests passed, zero failures: existing playback ranking, Mac device policies, architecture-specific update selection, installer behavior, poster interactions and native-player lifecycle.
- Six added cases cover Mac 1080p vs phone 720p Low Data targets, avoiding 4K in Low Data, smaller-file tie-breaking, avoiding oversized remuxes, early selection timing, lower-resolution fallback and older Intel codec preferences.
- Existing Mac Balanced and Highest rules remain intact. This update changes only the Mac source repository.
- Full Mac source archive ZIP integrity verified. Text patch applied against the build 155 source files and modified file contents compared.
- Five previously reported broad-suite failures remain documented in build 162; the full suite was not rerun for this focused change. They concern hero timing, static custom poster patterns, two pending-search states and legacy completion migration.
- Mac build 162 was already checked for M1 Home scrolling and poster-to-details navigation. This update does not claim new measured FPS, physical Intel or physical TV testing.
- Both Release DMGs passed disk-image verification and strict deep ad-hoc signature verification. Bundle ID, macOS 12 minimum, desktop version 0.5.18 and build 163 verified.
- Launcher, bundled JVM and native playback libraries checked for the correct architecture: 73 binaries in ARM package and 75 in Intel package.
- Apple Silicon package installed at /Applications/Mira.app with build 162 retained under outputs/Mira-release-163/previous/Mira.app. Account data and settings are outside the replaced bundle.
- Installed Settings UI verification pending.

## Release routing

The Mac updater reads the ordered GitHub releases list. The older Fire TV updater reads the GitHub latest-release alias. Publish the Mac-only v0.5.18 release with latest=false, preserving v0.5.17 as latest for Fire TV. Put the same updated manifest on both releases, retaining iPhone 161 and Fire TV 162 artifact entries. This prevents an APK-less Mac-only release from breaking the existing Fire TV updater while allowing Mac updates to work normally.
