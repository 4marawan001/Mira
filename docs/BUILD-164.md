# Mira iPhone 164 · 0.5.19

Mira now checks the iPhone's H.264, HEVC and AV1 hardware-decoding capabilities when recommending a source or choosing autoplay. Copies that need software decoding rank behind compatible codecs and remain available as fallbacks.

- Low Data retains the phone's 720p target; Balanced retains 1080p and the existing preference for reasonably sized disc encodes. Highest favors compatible codecs, then resolution and original-quality disc sources.
- File size and source readiness still count. Manual and First Stream modes, provider filters, saved settings, add-ons and app identity are preserved.
- The capability check runs once per process and is never synced to another device. The simulator deliberately skips the Mac host's hardware results.

115 regression checks passed, including 13 hardware-specific checks. The Debug preview built and launched on the iPhone 12 mini simulator; Home and all quality descriptions were visually checked. Physical-device arm64 source compilation passed. Final Release package verification is recorded in VALIDATION.md.

Hardware support is codec-level information, not a guarantee for every codec profile, HDR mode, audio track, container or playback URL. Ranking uses provider metadata and does not measure internet speed. Physical iPhone playback testing remains outstanding.

Sign and install `Mira-ios-164.ipa` with Sideloadly using the same Apple account and app identity as your installed Mira. The IPA is an unsigned Release package; it does not update the phone until it has been signed and installed.

Mac remains build 163 / 0.5.18; Fire TV remains build 162 / 0.5.17. This iPhone-only release is published without changing the TV's GitHub latest-release channel.

[Release assets](https://github.com/4marawan001/Mira/releases/tag/v0.5.19) · [Validation](https://github.com/4marawan001/Mira/releases/download/v0.5.19/VALIDATION.md)
