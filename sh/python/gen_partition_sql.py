#!/usr/local/bin/python3
# -*- coding: utf-8 -*-

import sys
import os

# 第一个参数：format；第二个参数：分表数；第三个参数：文件名（可以通过管道）
sql_format = sys.argv[1]
partition_num = int(sys.argv[2])
if not os.isatty(sys.stdin.fileno()):
    input_str = sys.stdin.read()
else:
    with open(sys.argv[3]) as file:
        input_str = file.read()

lines = input_str.split('\n')

for line in lines:
    if line is None or len(line) == 0:
        print("")
    else:
        table_suffix = int(line) % partition_num
        print(sql_format.format(table_suffix, line))
