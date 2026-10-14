# Mira iPhone 168 · 0.5.24

The reviewed iPhone maintenance update retains person lookup, profiles, add-ons, library and playback preferences.

- Profile/account switches clear the person cache. Session guards reject late responses from the previous profile, and immutable snapshots prevent shared mutable-map access.
- Cached person entries stay within a strict 200-entry bound; caller-owned lists are copied.
- General catalog search keeps the exact multi-word query through initial results, View All and later pages.
- Internal app version is verified as 0.5.24 / 168, with production identity `com.nuvio.media`.

This is an unsigned **Release IPA** for Sideloadly signing, supporting iOS 16.1+ on arm64 iPhones. Install over Mira with the same signing identity to preserve local data.

118 selected iPhone production-logic checks passed. The actual Debug iPhone 12 mini preview compiled and was reviewed before packaging. Physical-device playback, real-provider results, account sync and signing still require device checks; no complete-results or zero-lag guarantee is made.

Mac 165 and Fire TV 167 remain unchanged. This release does not become GitHub Latest, so older TV update checks keep working. The shared manifest points iPhone to this verified package.

## Package validation

The actual physical-iPhone **Release** package passed ZIP integrity, production bundle identity/version, arm64 architecture, physical-iOS Mach-O platform, and downloads-widget identity/version checks. It is unsigned for Sideloadly signing, with no embedded provisioning profile.

App: Mira, `com.nuvio.media`, version **0.5.24 / 168**, minimum iOS **16.1**. Package: **91,015,937 bytes**.

SHA-256:

```text
7efe306cc56f19365ff0c9051bdfea21c7680feb0c3aa4bdd4b9206237d4ca98
```

118 selected production-logic tests passed; the same source compiled in the Debug iPhone 12 mini simulator and the user reviewed it before packaging. Source archive integrity and the applied patch against build 155 passed. This is one final Release build after preview review.

The retained lookup is included; no app data or signing identity was changed. Physical-phone installation, signing, playback, provider credit coverage, account sync and sustained frame performance remain device checks. Mac 165 and TV 167 packages are unchanged.

[Download IPA](https://github.com/4marawan001/Mira/releases/download/v0.5.24/Mira.ipa) · [Source and checksums](https://github.com/4marawan001/Mira/releases/tag/v0.5.24)
