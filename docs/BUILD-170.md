# Mira Fire TV 170 — Better Balanced quality

Balanced now allows up to **40 decimal GB per two hours**, scaled to runtime: 20 GB for an hour, 40 GB for two hours, and 60 GB for three hours. This is a ceiling, not a target file size. Unknown runtime uses the existing estimate; unknown-size and oversized streams remain manual choices.

Balanced considers resolution, the device’s hardware decoder support, source type, and file size relative to runtime and codec. It reduces the preference for unusually tiny, heavily compressed copies: for a two-hour movie, an 18 GB 4K Blu-ray HEVC encode beats a 2 GB 4K HEVC copy. A good 1080p encode can beat a severely compressed 4K copy. Short episodes use a lower, runtime-scaled threshold. If only a small compatible source exists, it remains a fallback.

Once a reasonable size is reached, larger is not automatically better. Disc encodes remain preferred; a near-ceiling REMUX does not automatically win. Low Data still favors smaller 1080p on Mac and TV. Highest retains its resolution/disc preference without the Balanced ceiling. Provider metadata is an estimate: file size includes audio and does not establish actual video quality, bandwidth, HDR support or a playable URL.

Quality modes now re-rank current provider results instead of immediately replaying an old cached link or a matching binge group. Selection waits for providers to complete or the existing configured timeout. Legacy Manual, First Stream and regex behavior retains its own reuse options. Ranking scores are calculated once per candidate for sorting, reducing repeated metadata parsing.

Install over your existing Mira TV app to preserve settings and profiles. The APK keeps `app.mira.tv` and the existing Mira signing certificate. Android still requires installation confirmation.

iPhone remains at verified build 168 / 0.5.24 with its separate 1080p Balanced preference. This update changes Mac and TV.

# Fire TV 170 validation

- Mac quality/autoplay/loading tests: **68 passed, 0 failures, 0 skips**.
- TV quality/autoplay tests: **45 passed, 0 failures, 0 skips**.
- Regression cases cover the inclusive 40 GB boundary, oversized and unknown-size exclusion, runtime scaling, tiny two-hour 4K versus substantial 4K/HD encodes, short episodes, a small-file-only fallback, decoder limits, source filters, binge-group selection, and Low Data/Highest behavior. TV also retains 1,200 distinct synthetic candidates.
- Apple Silicon and Intel DMGs passed `hdiutil verify`; both app bundles passed strict deep signature verification. Internal identity is `app.mira.desktop`, version 0.5.25/build 169, macOS 12 minimum. All 102 Apple Silicon and 104 Intel Mach-O files contain the expected architecture. Each packaged Java 17 runtime initialized through the existing JNI smoke harness; Intel ran under Rosetta on the M1 host.
- All three TV APKs passed ZIP integrity, internal package/version/ABI checks and `apksigner verify`. Identity is `app.mira.tv`, version 0.5.26/build 170, with the existing MiraPersonal certificate. Private signing material remains local.
- Full source archives exclude private configuration, account data, signing keys and build caches. Text patches were applied to build 155 source, then the changed files were compared.

The signed TV Release quality controls are checked in the dedicated API 31 ARM64 emulator: D-pad navigation, the visible 40 GB Balanced description, saving Balanced, and returning Home. `quality-smoke.log` records **OK (1 test), 58.553 seconds** for this focused check. The separate populated-browsing smoke runner failed during local fixture installation in three attempts (keyboard proxy/text quoting/focus activation), so populated browsing is not counted as a pass for this release. Its failed logs remain locally recorded. The metadata-only fixture has no playable streams or credentials. No product binary change was made to mask those runner failures.

Quality ranking uses provider metadata and synthetic device cases. No physical Insignia playback test, physical Intel GUI test, real-stream quality/bitrate inspection, or sustained frame-pacing benchmark was performed. The earlier broad suites' two vendored TV failures and five desktop failures were not rerun or represented as fixed by this focused update. No zero-lag or universal-format compatibility claim is made.

The existing iPhone 168 Release IPA is unchanged and retained in the merged update channel.
