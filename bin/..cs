#!/usr/bin/env bash

cs="$(realpath "/usr/local/bin/$(ls -al /usr/local/bin/cs | awk '{print$11}')")"
"${cs}" $@