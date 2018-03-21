#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function

import sys
import time


def main():
    timestamp = int(time.time())
    for line in sys.stdin.readlines():
        print(': %s:0;%s' % (timestamp, line.strip()))
        timestamp += 1


if __name__ == '__main__':
    main()
