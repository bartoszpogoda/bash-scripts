#!/usr/bin/python3
import urllib.request
import re

# Znaleźć linki na stronie wikipedii. Wypisać je w postaci title -> href

WIKI_POLSKA_URL = 'http://pl.wikipedia.org/wiki/Polska'

fp = urllib.request.urlopen(WIKI_POLSKA_URL)
rBytes = fp.read()
html = rBytes.decode("utf8")
fp.close()

# 1. Search for proper <a href tags> with link starting with /wiki/
aHrefPattern = r"<a.*?href=\"/wiki/.*?\".*title.*?>"
hrefTags = re.findall(aHrefPattern, html)

# 2. Search for href and title values within href tags
for hrefTag in hrefTags:
    hrefAndTitlePattern = "href=\"(.*?)\".*?title=\"(.*?)\""

    result = re.search(hrefAndTitlePattern, hrefTag);
    if result != None:
        print(result.group(2) + " -> " + result.group(1))
