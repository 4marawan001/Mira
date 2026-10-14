# Mira Fire TV 170 — Better Balanced quality

Balanced now allows up to **40 decimal GB per two hours**, scaled to runtime: 20 GB for an hour, 40 GB for two hours, and 60 GB for three hours. This is a ceiling, not a target file size. Unknown runtime uses the existing estimate; unknown-size and oversized streams remain manual choices.

Balanced considers resolution, the device’s hardware decoder support, source type, and file size relative to runtime and codec. It reduces the preference for unusually tiny, heavily compressed copies: for a two-hour movie, an 18 GB 4K Blu-ray HEVC encode beats a 2 GB 4K HEVC copy. A good 1080p encode can beat a severely compressed 4K copy. Short episodes use a lower, runtime-scaled threshold. If only a small compatible source exists, it remains a fallback.

Once a reasonable size is reached, larger is not automatically better. Disc encodes remain preferred; a near-ceiling REMUX does not automatically win. Low Data still favors smaller 1080p on Mac and TV. Highest retains its resolution/disc preference without the Balanced ceiling. Provider metadata is an estimate: file size includes audio and does not establish actual video quality, bandwidth, HDR support or a playable URL.

Quality modes now re-rank current provider results instead of immediately replaying an old cached link or a matching binge group. Selection waits for providers to complete or the existing configured timeout. Legacy Manual, First Stream and regex behavior retains its own reuse options. Ranking scores are calculated once per candidate for sorting, reducing repeated metadata parsing.

Install over your existing Mira TV app to preserve settings and profiles. The APK keeps `app.mira.tv` and the existing Mira signing certificate. Android still requires installation confirmation.

iPhone remains at verified build 168 / 0.5.24 with its separate 1080p Balanced preference. This update changes Mac and TV.
