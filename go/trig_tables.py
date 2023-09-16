#! /usr/bin/env python3
#
# Generate Go arrays representing degrees to sine, and degrees to cosine lookup tables.

import sys
import math
import itertools

def grouper(n, iterable):
    it = iter(iterable)
    while True:
       chunk = tuple(itertools.islice(it, n))
       if not chunk:
           return
       yield chunk

it = range(0, 360)
print("var CosTable = [360]float32{")
for vals in grouper(5, it):
    print('\t', end='')
    for val in vals:
        print("{},".format(math.cos(math.radians(val))), end='')
    print()
print("}")
print()
print("var SinTable = [360]float32{")
for vals in grouper(5, it):
    print('\t', end='')
    for val in vals:
        print("{},".format(math.sin(math.radians(val))), end='')
    print()
print("}")
