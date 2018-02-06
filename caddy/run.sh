#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

ARGS=( "-conf" "/share/caddy/Caddyfile" $(jq --raw-output '.flags[]' $CONFIG_PATH) )

echo "Running Caddy with arguments: ${ARGS[*]}"

exec /usr/sbin/caddy ${ARGS[*]}
