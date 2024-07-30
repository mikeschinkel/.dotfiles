#!/bin/bash

{
  echo "${1#*=}"
  echo "$@"
} > ~/Projects/savetabs/args.txt

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --remote-debugging-port="${1#*=}" \
  --no-first-run \
  --disable-fre \
  --no-default-browser-check \
  --log-file="/Users/mikeschinkel/Projects/savetabs/chrome-debug.log" \
  --user-data-dir="/Users/mikeschinkel/Library/Application Support/Google/Chrome" \
  --profile-directory="Profile 1"

