#!/usr/bin/env bash

echo "$(jq -r .aws.sidestep.secret_key ${CONFIGFILES}/secrets.json)"
