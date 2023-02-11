#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import chardet
import sys
import re
import os

from urllib import parse

# 八进制转中文
def parse_oct_str(string):
    byte_array = []
    for value in string.split('\\')[1:]:
        byte_array.append(int(value, 8))

    input_byte = bytes(byte_array)
    input_charset = chardet.detect(input_byte)
    print(input_byte.decode(input_charset['encoding']), end = "")

def parse_url_str(string):
    print(parse.unquote(string), end = "")

# 读取参数，支持读取管道数据或者命令行的第一个参数
if not os.isatty(sys.stdin.fileno()):
    input_str = sys.stdin.read()
else:
    with open(sys.argv[1]) as file:
        input_str = file.read()

# 示例格式：\260\332\266\311\311\350\261\270\310\325\326\276\312\325\274\257\304\243\277\351
if re.match("^(\\\\\\d{1,3})+$", input_str):
    parse_oct_str(input_str)
# 示例格式："%E4%B8%AD\n%E5%9B%BD%2F"，注意，默认情况下，正则的'.'不能匹配换行符
elif re.match("(?:.|\n)*%", input_str):
    parse_url_str(input_str)
else:
    print(input_str)
    print("不支持的编码")
