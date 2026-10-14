# Mira Fire TV 172 — Lighter subtitle switching

A compact, solid subtitle side panel replaces the three-column overlay. Choose a language automatically, open a separate list for an exact file, or open appearance/timing controls. The active language shows its provider; the file list opens at the selected track. Individual file choices retain their selection instead of asking automatic selection to choose a different file.

Automatic validation now retains the top-ranked result and gives other providers a place before repeated releases from one provider. OpenSubtitles is eligible under the same matching rules; its numeric file IDs do not need to resemble a release filename. The checkmark indicates the active subtitle, not which providers were examined.

Subtitle analysis runs off the UI thread, one worker at a time, with a 20-second deadline and a bounded candidate pool. Reference activity arrays are limited before preparation, so UHD discs with many subtitle languages do not allocate one comparison array per track. Container indexing starts when an external subtitle is selected rather than with every video. Bitmap packets bypass the text timing observer, analysis sample buffers are capped, and caches no longer retain text from all previously opened movies. Stock/custom Java video buffers leave heap space for captions and UI instead of exceeding the byte target to fill a time target.

Arabic/English automatic matching, manual selection, Off, styling and delay controls remain. Timing correction still needs a suitable reference and confident alignment; no reference means no guaranteed correction. Other providers and files remain available manually beyond the bounded automatic attempt pool.

Release APKs keep the existing package and signing certificate. Install over Mira to retain app data. iPhone 168, Mac 169 and the existing iPhone lookup are unchanged.

See VALIDATION.md for checks and remaining physical-device testing. This release addresses observed resource pressure paths; it does not claim that the physical Insignia crash has been reproduced or that every playback source is smooth.
