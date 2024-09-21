#!/usr/bin/env bash

function trigger_binder() {
    local URL="${1}"

    local CONTENT=$(curl --location --connect-timeout 10 --write-out "%{response_code}" "${URL}")
    
    echo "Result: $CONTENT"

    local STATUSCODE=$(echo "$CONTENT" | tail -n 1)

    if [ "$STATUSCODE" -eq "200" ]; then
        echo "Success"
        exit 0
    fi

    echo "Error: HTTP status $STATUSCODE"
    exit 1
}

trigger_binder "$@"
