#!/bin/bash
#
# Sets paths.
# For Default Paths see: http://stackoverflow.com/a/9832813/102699
#

echo "Running .dotfiles/bash/020-paths.sh..."

add_path() {
  local sub
  local p
  sub="$1"
  p="$2"
    if [[ ":${PATH}:" != *":${p}:"* ]]; then
		  #echo "  Adding Path $1..."
		  if [ "${sub}" == "early" ]; then
        PATH="${p}:${PATH}"
      else
        PATH="${PATH}:${p}"
      fi
    fi
}
add_path_set() {
  local sub;
  sub="$1"
  path_scripts="$(find "${DOTFILES_DIR}/paths/${sub}/"*.sh | sort)"
  for path_script in $path_scripts; do
      #echo "    Processing ${path_script} file..";
      chmod +x "${path_script}"
      path_value="$(source "${path_script}")"
      add_path "${sub}" "${path_value}"
  done
}
printf "\n  PATH:\n\t%s\n\n" "${PATH//:/$'\n\t'}"

# if [ "${DOTFILES_DIR}" == "" ]; then
#     #echo "  Adding Path $1..."
#     DOTFILES_DIR=$(dirname $(pwd))
# fi
add_path_set "early"
add_path "late" "${DOTFILES_DIR}/bin"
add_path "late" "/usr/local/sbin"
add_path "late" "/opt/local/bin"
add_path "late" "/opt/local/sbin"
add_path_set "late"
add_path "${DOTFILES_DIR}/backup"

printf "\n  PATH:\n\t%s\n\n" "${PATH//:/$'\n\t'}"

