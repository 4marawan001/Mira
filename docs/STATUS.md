# Current status

[Documentation](README.md) · [Downloads](../README.md#download)

[Mira 0.6.2](https://github.com/4marawan001/Mira/releases/tag/v0.6.2) is the current stable-channel release. It distributes the same binaries as the 0.6.2 preview. Published build numbers are **209** for TV, **203** for Mac, and **204** for mobile.

## TV

[Build 210](https://github.com/4marawan001/Mira/releases/tag/v0.6.2-tv.210) is a manual-install preview with a four-second update toast and update controls in Settings. The 15 targeted updater tests passed. Physical TV verification is pending.

Build 209 restores the earlier TV navigation after the build 208 experiment and keeps the updated source filenames and branding. Fast scrolling can still drop frames. HDR output and sustained frame pacing remain open hardware checks. [TV test results](https://github.com/4marawan001/Mira/releases/download/v0.6.2/VALIDATION.md)

## Mac

Build 203 passed native runtime checks on Apple silicon and under Rosetta for the Intel package. A local clip displayed moving video and seek controls. Physical Intel, provider playback, and dialogue subtitle checks remain open. The preview label can cause the updater to offer 0.6.2 again even when build 203 is installed. [Release limitations](https://github.com/4marawan001/Mira/releases/tag/v0.6.2#known-limitations)

## Mobile

Build 204 passed iPhone/iPad package checks and simulator layout checks. Physical installation, playback, and sustained performance remain open across the mobile packages. iPhone and iPad share one IPA with a minimum OS version of 16.1. [Mobile validation](https://github.com/4marawan001/Mira/releases/download/v0.6.2/VALIDATION.md)

## Subtitles and interfaces

Automatic subtitle timing depends on a usable reference timeline and a matching cut. English and Arabic timing across full playback still need hardware testing. The five interfaces share some specialist screens and controls. [Playback and subtitle details](FEATURES.md)

## Reporting a problem

Include the platform, device model, Mira build, steps, and exact error. For subtitles, include the provider and whether the captions are early, late, or drift over time. Redact passwords, tokens, private add-on URLs, and personal data.

[Earlier build reports](README.md)
