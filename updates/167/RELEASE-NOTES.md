# Mira Fire TV 167 · 0.5.22

Mira’s TV edition now brings its cinematic Home and compact source picker closer to the iPhone and Mac experience, with remote controls throughout.

- **Automatic quality:** Low Data favors smaller 1080p copies. Balanced favors hardware-supported 4K on a capable 4K display, otherwise 1080p, with a 30 GB-per-two-hour budget scaled by known runtime. Highest favors the highest hardware-supported resolution, then disc/REMUX sources. Unknown sizes stay manual in Balanced.
- **Device-aware selection:** cached Android hardware-decoder and display checks inform ranking. Known unsupported codecs/resolutions stay available for manual selection. Existing hardware-first playback still validates the actual format when it opens.
- **Lighter browsing:** removed duplicate legacy catalog presentation work, bounded poster decoding, reduced simultaneous image downloads, removed source-menu capture blur and an unnecessary poster layer, and reduced unnecessary focus scrolling.
- **Autoplay coordination:** serializes provider responses and timeout-driven ranking to prevent competing playback choices.
- **Cleaner playback menu:** one recommended source, compact quality/size/provider rows, and file details on Menu or long Select. The hero Play button now starts the playback route.
- **Fresh-install fix:** Home keeps Search, Saved, Settings, and source setup reachable even when there are no add-ons or catalogs.
- **Updates:** signed with the existing Mira TV certificate; installs over the previous TV build. iPhone and Mac releases remain independent.

See VALIDATION.md for exact test results and remaining physical-TV checks. Emulator timings do not establish smoothness on an Insignia TV. No hover/video previews or logo dance were added to TV.
