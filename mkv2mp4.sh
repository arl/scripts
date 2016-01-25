#! /bin/bash
#
# mkv2mp4: converts $1 (should be a container supported by ffmpeg) to $1.mp4
# video and audio of input file are both copied into a mp4 container, while
# the audio is converted to 320CBR mp3
# resulting file should be playable on more, if not all, video-stream capable
# smart tv's

ffmpeg -i "$1" -vcodec copy -acodec libmp3lame -b:a 320k "${1:r}.mp4"
