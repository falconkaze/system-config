#!/usr/local/bin/ipython
# -*- coding: utf-8 -*-

import os

# 仅支持 Mac，需要先安装：brew install chrome-cli
tab_info = {}
with os.popen('chrome-cli info', mode = 'r') as res:
    result = res.readlines()
    for line in result:
        line = line.rstrip('\n')
        kv = line.split(': ')
        tab_info[kv[0].strip()] = kv[1].strip()

title = tab_info['Title']
url = tab_info['Url']
print("[{}]({})".format(title, url), end = "")
