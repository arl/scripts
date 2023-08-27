#!/usr/bin/env python3

import os
import re
import sys

movie_ext = "mkv"
srt_re = r'[Ee](\d{2})'

def main():
    dry_run = True

    # check if '--do' is in the command line arguments
    if '--do' in sys.argv:
        dry_run = False

    dir_path = '.'
    file_list = os.listdir(dir_path)

    file_list.sort()

    # Create a list to hold matching filenames
    file_pairs = []

    for file_name in file_list:
        if not file_name.endswith('.srt'):
            continue

        matches = re.search(srt_re, file_name)
        if not matches:
            print(f"can't find season nor episode for {file_name}")
            continue

        # check matching movies
        matching_episodes = []
        movie_re = f".*[Ee]{matches.group(1)}.*\.{movie_ext}$"
        for fname in file_list:
            if re.match(movie_re, fname):
                new_name = fname[:-3] + "srt"
                matching_episodes.append((fname, file_name, new_name))

        if len(matching_episodes) == 0:
            print(f"can't find movie matching {file_name}")
            continue
        if len(matching_episodes) > 1:
            print(f"found more than one movie matching {file_name}")
            continue

        file_pairs.extend(matching_episodes)

    if dry_run:
        for pair in file_pairs:
            print(f"\"{pair[1]}\" -> \"{pair[2]}\"")
    else:
        print('#!/bin/bash')
        for pair in file_pairs:
            print(f"mv \"{pair[1]}\" \"{pair[2]}\"")
            if movie_ext == "mkv":
                # found in mkvtoolnix package (sudo apt install mkvtoolnix)
                new_title = pair[0][:-4]
                print(f"mkvpropedit \"{pair[0]}\" -s title=\"{new_title}\"")


if __name__ == "__main__":
    main()
