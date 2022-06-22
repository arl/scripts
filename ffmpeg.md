# ffmpeg

## Reencode the audio track of a video to mp3
```
ffmpeg -i $1 -acodec mp3 -vcodec copy -bsf:v h264_mp4toannexb ./reencoded/$1
```
