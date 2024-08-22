#!/usr/bin/env bash
#
# Export vars.
#
#set -x

echo "Running .dotfiles/bash/030-exports.sh..."

echo

exports="${DOTFILES_DIR}/exports"

for dir in ${exports}/*; do
	if ! [ -d "${dir}" ]; then
		continue
	fi
	if [[ "${dir}" == */archive ]]; then
		continue
	fi
	for export_file in ${dir}/*.sh; do
		if ! [ -f "${export_file}" ]; then
			continue
		fi

		#remove filepath and .sh extension
		basename=$(basename -s .sh $export_file)

		#echo "Processing exports/${basename}.sh file..";
		export_var=$(to-upper "${basename}")

		#echo "Running ${export_file}.."
		export_value=$(${export_file})

		echo "  Exporting ${export_var}..."
		export $export_var="${export_value}"

	done
done

echo "  ENVIRONMENT VARS:"
env | awk -F '=' '{
	if ($1 ~ /(_KEY|_SECRET|_TOKEN|_PASSWORD)/) {
		$0 = sprintf("%s= [REDACTED]",$1)
	} else {
		gsub(/\n/, "\\n", $0)
		gsub(/\t/, "\\t", $0)
		gsub(/\r/, "\\r", $0)
		if (length($0) > 80) {
			$0 = sprintf("%s [TRUNCATED]",substr($0,1,68))
		}
	}
	print "    " $0
}'
echo

set +x