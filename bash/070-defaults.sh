#!/bin/bash
#
#
echo "Running .dotfiles/bash/070-defaults.sh..."

#
# Change Google Chrome check for updates to only once per week
#
# See: https://www.macobserver.com/tmo/article/how-manage-the-secret-software-that-google-chrome-installs-on-your-mac
#
defaults write com.google.Keystone.Agent checkInterval 604800


# Accessibility > Pointer Control > Trackpad Options > Use Trackpad for dragging to “On”
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

# Accessibility > Pointer Control > Trackpad Options > Dragging Style to "Without Drag Lock"
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false

# Trackpad > Point & Click > Look up & Data Detectors to “Tap with Three Fingers”
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Restart the trackpad
killall-with-timeout cfprefsd >/dev/null 2>&1

# Disable Force Click and Haptic Feedback to allow dragging dock items
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool true

# Restart Dock to apply changes
killall-with-timeout Dock >/dev/null 2>&1
