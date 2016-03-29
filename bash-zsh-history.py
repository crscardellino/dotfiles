#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import time


def main():
    timestamp = int(time.time())
    for line in sys.stdin.readlines():
        print ': {}:0;{}'.format(timestamp, line.strip())
        timestamp += 1


if __name__ == '__main__':
    main()
