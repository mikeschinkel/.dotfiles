#!/usr/bin/env bash
#
#

echo "Running .dotfiles/setup-install.sh..."

for installer in install/*.sh; do


	#remove filepath prefix: install/???-install-
	basename=${installer:20}

	#remove .sh extension
	slug=${basename%\.sh}

  echo ${slug} > PROGRESS

	slug=$(cat PROGRESS)
  echo "Processing ${slug} file..";

done
