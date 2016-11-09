#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import subprocess
from argparse import ArgumentParser

print (sys.version)

def is_valid_file(parser, arg):
    if not os.path.exists(arg):
        parser.error('cannot access {}: no such file or directory'.format(arg))
    return os.path.abspath(arg)

parser = ArgumentParser(description='Subperfect, unzip and rename subtitles so that they match video files')
parser.add_argument('-z', '--zip', dest='zipsrt', required=True,
                    help='path of the zipped subtitle',
                    type=lambda x: is_valid_file(parser, x))

args = parser.parse_args()
print(args.zipsrt)

try:
    import ipdb
    ipdb.set_trace()
    cmd = ['unzip', '-l', args.zipsrt]
    print(' '.join(cmd))
    out = subprocess.check_output(cmd, universal_newlines=True).split('\n')
    print (out[2])
    name_pos = out[2].find('Name')
    for idx in range(3, len(out)):
        line = out[idx]
        if len(line) > name_pos:
            print('line {}: {}'.format(idx, line[name_pos:]))
    
    # print(out)
except subprocess.SubprocessError as e:
    print("unzip error: {}".format(e))
    sys.exit(1)

