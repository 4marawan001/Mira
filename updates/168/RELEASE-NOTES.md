# Mira iPhone 168 · 0.5.24

The reviewed iPhone maintenance update retains person lookup, profiles, add-ons, library and playback preferences.

- Profile/account switches clear the person cache. Session guards reject late responses from the previous profile, and immutable snapshots prevent shared mutable-map access.
- Cached person entries stay within a strict 200-entry bound; caller-owned lists are copied.
- General catalog search keeps the exact multi-word query through initial results, View All and later pages.
- Internal app version is verified as 0.5.24 / 168, with production identity `com.nuvio.media`.

This is an unsigned **Release IPA** for Sideloadly signing, supporting iOS 16.1+ on arm64 iPhones. Install over Mira with the same signing identity to preserve local data.

118 selected iPhone production-logic checks passed. The actual Debug iPhone 12 mini preview compiled and was reviewed before packaging. Physical-device playback, real-provider results, account sync and signing still require device checks; no complete-results or zero-lag guarantee is made.

Mac 165 and Fire TV 167 remain unchanged. This release does not become GitHub Latest, so older TV update checks keep working. The shared manifest points iPhone to this verified package.
