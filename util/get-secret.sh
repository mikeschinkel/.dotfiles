#!/usr/bin/env bash

jq -r $1 "${CONFIGFILES}/secrets.json"
