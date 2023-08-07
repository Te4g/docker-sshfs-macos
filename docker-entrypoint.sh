#!/bin/sh
set -e

sshfs \
  -p "$SSH_PORT" \
  "$ADDRESS:$DIRECTORY" \
  /usr/share/nginx/html \
  -o allow_other \
  -o StrictHostKeyChecking=no

exec "$@"
