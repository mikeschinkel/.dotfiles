#!/usr/bin/env bash

export_var=$(to-upper.sh "$1")

export_file=$(to-lower.sh "$1")

export_file="${DOTFILES_DIR}/exports/${export_file}.sh"

echo Exporting ${export_var}...

chmod +x "${export_file}"
export_value="$(source "${export_file}")"
export ${export_var}="${export_value}"
echo "  EXPORTED: ${export_var}=${export_value}"
echo
