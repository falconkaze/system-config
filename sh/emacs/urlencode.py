#!/usr/bin/env python3

import urllib.parse
import sys

raw_str = sys.argv[1]
encode_str = urllib.parse.quote(raw_str)
print(encode_str, end='')
