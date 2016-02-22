#!/usr/bin/env bash

echo "Unencrypting $1..."

personal_email="$(personal-email.sh)"

gpg "$1"

