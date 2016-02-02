#!/usr/bin/env bash

echo "$(jq -r .aws.sidestep.access_key ${CONFIGFILES}/secrets.json)"
