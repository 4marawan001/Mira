# TV interfaces · build 199

The default Mira interface retains its previous TV header, Play/Details banner and navigation, restored from build 196 after feedback.

The four alternate designs follow the Mac’s main compositions: Apple has a labeled sidebar and centered rounded artwork; Netflix has text navigation and a left-aligned billboard; Cinema has split artwork, serif headings and warm colors; Library has a compact sidebar and collection grid. The themed Settings landing pages, palettes and corners were aligned too. Density scales artwork rather than the whole screen.

## Install and customize

Use [ARMv7](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-armv7.apk) for the tested Insignia AFTHY7ABBA, [ARM64](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-arm64.apk) for a compatible 64-bit installation, or [Universal](https://github.com/4marawan001/Mira/releases/download/v0.6.1-tv.1/Mira-FireTV-universal.apk). Install over the current app to preserve data.

Choose a design under Interfaces. Custom choices persist separately; Reset that design applies its new defaults and changes appearance only.

## Checks and limits

The APK signatures match build 196; 56 selected tests passed. Home, Settings and remote navigation were checked across the five designs on the physical Fire TV. Source and validation reports are attached.

Remote focus, feature arrows, playback controls and some specialist settings remain TV-specific. This is not a pixel-identical port of every Mac screen, and no new frame-rate improvement is claimed. Streaming services, quality and subtitle behavior were unchanged.

Unchanged Mac build 198 packages and source are included for compatibility with desktop clients that inspect the newest release. Stable/latest distribution remains unchanged.
