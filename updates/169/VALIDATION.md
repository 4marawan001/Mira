# Mac 169 validation

- Mac quality/autoplay/loading tests: **68 passed, 0 failures, 0 skips**.
- TV quality/autoplay tests: **45 passed, 0 failures, 0 skips**.
- Regression cases cover the inclusive 40 GB boundary, oversized and unknown-size exclusion, runtime scaling, tiny two-hour 4K versus substantial 4K/HD encodes, short episodes, a small-file-only fallback, decoder limits, source filters, binge-group selection, and Low Data/Highest behavior. TV also retains 1,200 distinct synthetic candidates.
- Apple Silicon and Intel DMGs passed `hdiutil verify`; both app bundles passed strict deep signature verification. Internal identity is `app.mira.desktop`, version 0.5.25/build 169, macOS 12 minimum. All 102 Apple Silicon and 104 Intel Mach-O files contain the expected architecture. Each packaged Java 17 runtime initialized through the existing JNI smoke harness; Intel ran under Rosetta on the M1 host.
- All three TV APKs passed ZIP integrity, internal package/version/ABI checks and `apksigner verify`. Identity is `app.mira.tv`, version 0.5.26/build 170, with the existing MiraPersonal certificate. Private signing material remains local.
- Full source archives exclude private configuration, account data, signing keys and build caches. Text patches were applied to build 155 source, then the changed files were compared.

The signed TV Release quality controls are checked in the dedicated API 31 ARM64 emulator: D-pad navigation, the visible 40 GB Balanced description, saving Balanced, and returning Home. `quality-smoke.log` records **OK (1 test), 58.553 seconds** for this focused check. The separate populated-browsing smoke runner failed during local fixture installation in three attempts (keyboard proxy/text quoting/focus activation), so populated browsing is not counted as a pass for this release. Its failed logs remain locally recorded. The metadata-only fixture has no playable streams or credentials. No product binary change was made to mask those runner failures.

Quality ranking uses provider metadata and synthetic device cases. No physical Insignia playback test, physical Intel GUI test, real-stream quality/bitrate inspection, or sustained frame-pacing benchmark was performed. The earlier broad suites' two vendored TV failures and five desktop failures were not rerun or represented as fixed by this focused update. No zero-lag or universal-format compatibility claim is made.

The existing iPhone 168 Release IPA is unchanged and retained in the merged update channel.
