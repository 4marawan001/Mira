# Build 182 source changes

Build 182 / 0.5.38 is published for iPhone and Mac; TV remains build 180. Full source archives are attached to [release 0.5.38](https://github.com/4marawan001/Mira/releases/tag/v0.5.38). These smaller patches record the verified changes from build 181.

Apply `Mira-ios-changes-from-181.patch` to `Mira-ios-source-181.zip` or `Mira-macOS-changes-from-181.patch` to `Mira-macOS-source-181.zip` from [release 0.5.37](https://github.com/4marawan001/Mira/releases/tag/v0.5.37). Both patches were applied to their bases and every modified file compared with the working source. SOURCE-CHANGES.json lists the paths.

The changes scope and cancel manual subtitle cue requests, parse away from the UI thread, reuse already-corrected cue timestamps and cancel competing automatic alignment during manual calibration. The iPhone's pending-provider empty state now offers Retry instead of leaving loading active. Existing profile/PIN, lookup and provider data behavior is retained. Test fixtures now follow the current search, static-poster, placeholder-duration and hero policies.

See [current status](../../docs/STATUS.md) for full-suite results and remaining Media3 runtime failures. The owner reviewed preview 182 and approved Release packaging. Previously published binaries are preserved.
