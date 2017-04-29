#! /usr/bin/env python2.7

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

it = xrange(0, 360)
print "var CosTable = []float32{"
for vals in grouper(5, it):
    for val in vals:
        print math.cos(math.radians(val)), ",",
    print
print "}"
print 
print "var SinTable = []float32{"
for vals in grouper(5, it):
    for val in vals:
        print math.sin(math.radians(val)), ",",
    print
print "}"
