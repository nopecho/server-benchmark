#!/bin/sh

# shellcheck disable=SC2034
LOCUST_WEB_HOST=http://localhost
LOCUST_WEB_PORT=8089
LOCUST_WEB_URL=$PINPOINT_WEB_HOST:$PINPOINT_WEB_PORT

RESPONSE_CODE=$(curl -o /dev/null -s -w "%{http_code}" LOCUST_WEB_URL)

if [[ $RESPONSE_CODE == 2* ]]; then
    open -a "Google Chrome" LOCUST_WEB_URL

elif [[ $RESPONSE_CODE == 4* ]] || [[ $RESPONSE_CODE == 5* ]]; then
    echo "️ 🦗 locust web ui is not running 🦗"
else
    echo "Received unexpected status code: $RESPONSE_CODE"
fi