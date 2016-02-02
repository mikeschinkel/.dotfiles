#!/usr/bin/env bash

echo "Detaching /Volumes/$1..."
DMG_DEVICE=$(hdiutil info | grep "/Volumes/$1")
DMG_DEVICE=${DMG_DEVICE:0:10}
sudo hdiutil detach "${DMG_DEVICE}"
DMG_DEVICE=

