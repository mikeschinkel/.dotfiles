#!/usr/bin/env bash
echo Installing HomeBrew, Part 2...

new-export HOMEBREW_GITHUB_API_TOKEN "\$(get-secret .github.homebrew.access_token)"

