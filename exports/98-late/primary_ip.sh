#!/usr/bin/env bash

ifconfig en0 | grep "inet " | awk '{print $2}'
