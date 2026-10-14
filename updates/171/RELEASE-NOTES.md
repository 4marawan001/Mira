# Mira Fire TV 171 — Subtitle matching and stability

External Arabic and English subtitle selection now uses provider release metadata instead of opaque IDs alone. Choose a language in the subtitle panel to request the best available track; choosing a specific row retains that exact choice.

- Prefer a matching full-dialogue embedded subtitle, then rank add-on tracks by language, release, frame rate, stream association and provider-reported hash match.
- Distinguish fractional rates such as 23.976/29.97 from 24/30 fps, and recognize forced-only release labels.
- Validate up to three distinct add-on downloads, trying another when a track is empty, unavailable or unparseable. Keep the existing track during this search.
- Cancel actual subtitle network calls when changing selection or reaching a timeout; cap response size. Preserve provider-owned request headers and strip credentials on out-of-scope redirects.
- Reuse the renderer's subtitle download during sync analysis, avoiding a duplicate request and renderer restart. Repaint active cues when the subtitle view is recreated.
- Apply repeat synchronization to original cues so corrections do not compound. Ignore stale results after switching subtitle, stream or turning subtitles off. Reset the previous track's manual offset when explicitly changing track/language.
- Enable automatic synchronization by default for new preferences; selecting a language enables it. Existing explicit disabled preferences stay disabled until that action or a Settings change.

Automatic retiming is confidence-gated and needs a usable embedded subtitle timing reference in the selected video. It can correct offset/drift when the reference is suitable, but cannot guarantee exact sync for every movie cut or provider file. With no reliable match, it keeps the original timing and reports the limitation. MPV/libass paths that cannot use this sidecar retiming report unsupported; embedded tracks and manual selection remain available.

Install this signed Release APK over Mira without uninstalling. Package identity and signing certificate are preserved. The shared update channel keeps iPhone 168 and Mac 169 unchanged; the iPhone lookup is retained.

See VALIDATION.md for actual checks and remaining physical-TV tests. No private add-on URLs, account data or signing keys are included.
