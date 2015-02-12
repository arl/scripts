#! /bin/bash

# run a simple python http server, serving jqapi documentation

JQAPI_ROOT="/home/panty/Documentation/jquery/jqapi"

pushd .
cd "${JQAPI_ROOT}"
python -m SimpleHTTPServer 8033
popd
