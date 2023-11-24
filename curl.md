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


## Show exit code as number on stdout, and output to stderr

   STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" URL)
   if [ "$http_code" -ne 200 ]; then
      exit "$http_code"
   fi
