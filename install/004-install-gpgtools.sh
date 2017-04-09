#!/usr/bin/env bash

echo “Unencrypting secret.json…”
cd config
unencrypt-file secret.json.gpg


