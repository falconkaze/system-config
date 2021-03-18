#!/usr/bin/env python3

import qrcode
import sys

text_data = sys.argv[1]
image = qrcode.make(text_data)
image.show()
