#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CADDY_SHARE_PATH="/share/caddy"
CADDY_PATH=/usr/sbin/caddy

ARGS=( "-conf" "$CADDY_SHARE_PATH/Caddyfile" $(jq --raw-output '.flags[]' $CONFIG_PATH) )

echo "Running Caddy with arguments: ${ARGS[*]}"

if [ -f "$CADDY_SHARE_PATH/caddy.bin" ]; then
    CADDY_PATH="$CADDY_SHARE_PATH/caddy.bin"
    echo "Found custom Caddy: $($CADDY_PATH -version)"
else
    echo "Using built-in Caddy: $($CADDY_PATH -version)"
fi

exec $CADDY_PATH ${ARGS[*]}
