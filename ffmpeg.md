# ffmpeg

## Reencode the audio track of a video to mp3
```
ffmpeg -i $1 -acodec mp3 -vcodec copy -bsf:v h264_mp4toannexb ./reencoded/$1
```

## Remove an audio stream from a video

```
ffmpeg -i $1 -map 0 -map -0:a:0 -c copy ./modified/$1
```

 - `-map 0:`      -> maps all streams from the input file
 - `-map -0:a:0:` -> excludes the first audio stream
 - `-c copy:`     -> copies all streams without re-encoding

## Keep only one of the subtitles streams

```
ffmpeg -i $1 \
  -map 0:v \
  -map 0:a \
  -map 0:3 \
  -c copy \
  -disposition:s:0 default \
  ./modified/$1
```

## Reencode video stream to h264, let video and subtitles as-is

```
ffmpeg -i input.mkv \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -c:a copy \
  -c:s copy \
  output.mkv
```
