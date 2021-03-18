#!/usr/bin/env bash

. ../../common/func_common

template=$1
title=$(python3 ./urlencode.py "$2")

protocol_url="org-protocol://capture?template=${template}&title=${title}"
echo "$protocol_url"
/usr/local/bin/emacsclient -s default -n -a -e "${protocol_url}"
