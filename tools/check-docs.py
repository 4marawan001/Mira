#!/usr/bin/env python3
"""Check public documentation links, images and current platform versions offline."""
from pathlib import Path
from urllib.parse import unquote, urlsplit
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
PAGES = [ROOT / 'README.md', *(ROOT / 'docs').glob('*.md'), ROOT / 'updates/README.md', ROOT / 'updates/182/SOURCE.md']
errors = []
checked = 0

def anchors(path):
    found = set()
    counts = {}
    for title in re.findall(r'^#{1,6}\s+(.+)$', path.read_text(), re.M):
        slug = re.sub(r'[^\w\- ]', '', title.lower()).replace(' ', '-')
        n = counts.get(slug, 0)
        counts[slug] = n + 1
        found.add(slug + (f'-{n}' if n else ''))
    return found

for page in PAGES:
    body = page.read_text()
    # Ignore code examples: paths in examples describe external build checkouts.
    body = re.sub(r'```.*?```', '', body, flags=re.S)
    links = re.findall(r'!?\[[^\]]*\]\(([^)]+)\)', body)
    links += re.findall(r'(?:href|src)="([^"]+)"', body)
    for raw in links:
        raw = raw.strip().strip('<>')
        url = urlsplit(raw)
        if url.scheme or url.netloc:
            continue
        target = (page.parent / unquote(url.path)).resolve() if url.path else page
        checked += 1
        if not target.exists():
            errors.append(f'{page.relative_to(ROOT)}: missing {raw}')
        elif url.fragment and target.suffix == '.md' and unquote(url.fragment) not in anchors(target):
            errors.append(f'{page.relative_to(ROOT)}: missing anchor {raw}')
    for tag in re.findall(r'<img\b[^>]*>', body):
        if not re.search(r'\balt="[^\"]+"', tag):
            errors.append(f'{page.relative_to(ROOT)}: image lacks useful alt text')
readme = (ROOT / 'README.md').read_text()
for expected in ['iPhone-181-', 'Mac-181-', 'Fire_TV-180-']:
    if expected not in readme:
        errors.append('README: stale or missing badge ' + expected)
for expected in ['v0.5.37/Mira.ipa', 'v0.5.37/Mira-macOS-arm64.dmg', 'v0.5.37/Mira-macOS-x86_64.dmg', 'v0.5.36/Mira-FireTV-universal.apk']:
    if expected not in readme:
        errors.append('README: stale or missing package ' + expected)
if errors:
    print('\n'.join(errors))
    sys.exit(1)
print(f'Checked {len(PAGES)} Markdown pages and {checked} local links/images; current downloads and badges match.')
