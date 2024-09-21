# New Mac Setup TODO

```
softwareupdate -i -r --agree-to-license
xcode-select --install
chsh -s /bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/miksch1/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install bash
chsh -s “$(echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells)”
git clone https://github.com/mikeschinkel/.dotfiles
cd ~/.dotfiles
brew bundle --file="${HOME}/.dotfiles/Brewfile"
```
# Settings
## Accessibility > Pointer Control > Trackpad Options > Use Trackpad for dragging to “On”
```
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
```

## Accessibility > Pointer Control > Trackpad Options > Dragging Style to "Without Drag Lock"
```
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
```

## Trackpad > Point & Click > Look up & Data Detectors to “Tap with Three Fingers”
```
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
```


#=> iterm2: Import .dotfiles/config/mikes-iterm2-config.json
#=> jetbrains-toolbox: Install GoLand, IntelliJ, DataGrip
#=> rectangle: Set Maximize to Ctrl-Alt-Cmd-F
