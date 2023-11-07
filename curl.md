# Curl

## POST data from string

   curl -d "data.json" -X POST [URL]

## POST data from file

   curl -d "@data.json" -X POST [URL]

## Send Headers

    curl [URL]
      -H "Content-Type: application/json"
      -H "Accept: application/json"
      -d "[json data]"

## Show exit code as number

    curl --fail --silent --output /dev/null --write '%{http_code}' $URL)

