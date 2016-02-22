#!/usr/bin/env bash

echo "Encrypting $1..."

personal_email="$(personal-email.sh)"

gpg -e -r "${personal_email}" "$1"

