#!/usr/bin/env bash

echo Cloning bitbucket.org/mikeschinkel/private….

cd "${DOTFILES_DIR}/"

rm -rf private

git clone git@bitbucket.org:mikeschinkel/private.git 

mkdir -p private

cd private
cp config/*    ../config
cp data/*      ../data
cp licenses/*  ../licenses
cp -R purchased ../purchased

cd "${DOTFILES_DIR}/"

echo
