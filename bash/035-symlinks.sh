#!/usr/bin/env bash
#
# Export vars.
#

echo "Running .dotfiles/bash/035-symlinks.sh..."

echo

echo "   Symlinking airport"
ln -sf /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport /usr/local/bin/airport


