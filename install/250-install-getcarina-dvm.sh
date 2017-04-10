#!/usr/bin/env bash

echo Installing Carina...
brew install carina
echo

new-export CARINA_USERNAME "\$(get-secret .rackspace.carina.username)"
new-export CARINA_APIKEY "\$(get-secret .rackspace.carina.apikey)"

echo Installing Carina DVM...
curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
echo

# newsource.sh "/Users/mikeschinkel/.dvm/dvm.sh"

