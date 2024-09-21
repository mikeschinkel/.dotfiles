#!/usr/bin/env bash

echo Cloning bitbucket.org/miksch1/private….

cd "${DOTFILES_DIR}/"

rm -rf private

git clone git@bitbucket.org:miksch1/private.git

mkdir -p private

cd private
bash copy-files.sh

cd "${DOTFILES_DIR}/"

echo
