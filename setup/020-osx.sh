#!/usr/bin/env bash

#Show Hidden Files in Finder
# See: http://osxdaily.com/2009/02/25/show-hidden-files-in-os-x/
defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

#New Finder Windows shows home folder
defaults write com.apple.finder NewWindowTarget PfHm

#Default to list view in Finder
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

#Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles YES && killall Finder

#Show User's Library Folder
chflags nohidden ~/Library/

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Disable animations when opening a Quick Look window.
defaults write -g QLPanelAnimationDuration -float 0
# Accelerated playback when adjusting the window size (Cocoa applications).
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# Disable animation when opening the Info window in OS X Finder (cmd⌘ + i).
defaults write com.apple.finder DisableAllAnimations -bool true
# Disable animations when you open an application from the Dock.
defaults write com.apple.dock launchanim -bool false
# Make all animations faster that are used by Mission Control.
defaults write com.apple.dock expose-animation-duration -float 0.1
# Disable the delay when you hide the Dock
defaults write com.apple.Dock autohide-delay -float 0
# Disable the animation when you sending and replying an e-mail
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
# Disable the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

#To undo changes see: http://www.defaults-write.com/10-terminal-commands-to-speed-up-your-mac-in-os-x-el-capitan/

#These next from mathiasbynens: https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Always show scrollbars (Possible values: `WhenScrolling`, `Automatic` and `Always`)
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# DO NOT Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# https://github.com/ymendel/dotfiles/blob/master/osx/finder.defaults
#enable text selection in QuickLook:
defaults write com.apple.finder QLEnableTextSelection -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Enable the debug menu in iCal (pre-10.8)
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

#From https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Expand the "Open with" and "Sharing & Permissions" panes
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true Privileges -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# New window points to home
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#From http://www.macosxtips.co.uk/index_files/terminal-commands-for-hidden-mac-os-x-settings.php)

#Make hidden applications' dock icons translucent.
defaults write com.apple.Dock showhidden -bool YES

#Set expanded save dialogs as default (
# showing column/list view of folders rather than a drop down menu).
# Replace TRUE with FALSE to reverse.
defaults write -g NSNavPanelExpandedStateForSaveMode -bool YES

# Set the history limit in Safari to a certain number of items and and/or a certain age.
defaults write com.apple.Safari WebKitHistoryItemLimit 9999
defaults write com.apple.Safari WebKitHistoryAgeInDaysLimit 360
# Enable the debug menu in Safari.
defaults write com.apple.safari IncludeDebugMenu -bool YES

#Deactivate Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool YES && killall Dock


######################
### Chrome Specific
######################
# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true


######################
### Mail Specific
######################
# Copy email addresses as `Foo Bar <foo@example.com>` instead of  `foo@example.com` in Mail.app
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool true
# Doesn't work?  http://macperformanceguide.com/blog/2013/20131028_2-Mavericks-copy-email.html

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
