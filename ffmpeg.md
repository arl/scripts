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
