# Mira iPhone 164 source

The full source snapshot is `Mira-ios-source-164.zip` (folder `Mira-ios`). It excludes local account configuration, signing keys, build caches and installed app data. Reuse the workspace toolchains and `Mira-Handoff/env.sh` locally; see `MIRA_BUILD.md` and `scripts/build-custom-ios.sh`.

Alternatively extract `Mira-ios-source.zip` from release v0.5.10 (folder `Mira`), then apply `Mira-ios-changes-from-155.patch`. The patch is checked against the build 155 base. iPhone 164 is 0.5.19; Mac 163 and Fire TV 162 keep their existing versions.
