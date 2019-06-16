#!/usr/bin/env bash

echo "Installing Go Language..."
brew install golang

chmod +x "${DOTFILES_DIR}/bin/new-export"
new-export "GOPATH" "${HOME}/go"
new-export "GOROOT" "/usr/local/opt/go/libexec"

GOPATH="${HOME}/go"
GOROOT="/usr/local/opt/go/libexec"

chmod +x "${DOTFILES_DIR}/bin/new-path"
new-path GOLANG "${GOPATH}/bin"
new-path GOROOT "${GOROOT}/bin"
