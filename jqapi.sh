#! /bin/bash

# run a simple python http server, serving jqapi documentation
# to browe offline the content the http://jqapi.com/ website
JQAPI_ROOT="/home/panty/Documentation/jquery/jqapi"
SERVER_PORT=8033

echo jqapi served at http://localhost:$SERVER_PORT

pushd . > /dev/null
cd "${JQAPI_ROOT}"
python -m SimpleHTTPServer $SERVER_PORT
popd > /dev/null
