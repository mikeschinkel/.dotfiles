#!/usr/bin/env bash

echo "$(find /usr/local/ec2 -maxdepth 1 -type d | grep ec2-api-tools)"
