#!/usr/bin/env bash

echo "Setting Google DNS..."
sudo networksetup -setdnsservers "Wi-Fi" "8.8.8.8" "8.8.4.4"
echo