#!/bin/sh

# shellcheck disable=SC2034
PINPOINT_WEB_HOST=http://localhost
PINPOINT_WEB_PORT=8080
PINPOINT_WEB_URL=$PINPOINT_WEB_HOST:$PINPOINT_WEB_PORT

RESPONSE_CODE=$(curl -o /dev/null -s -w "%{http_code}" $PINPOINT_WEB_URL)

if [[ $RESPONSE_CODE == 2* ]]; then
    open -a "Google Chrome" $PINPOINT_WEB_URL

elif [[ $RESPONSE_CODE == 4* ]] || [[ $RESPONSE_CODE == 5* ]]; then
    echo "☠️ pinpoint web server is not running ☠️"
else
    echo "Received unexpected status code: $RESPONSE_CODE"
fi