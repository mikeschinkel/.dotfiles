#!/usr/bin/env bash
#

save_dir=$(pwd)
echo -e ""
echo -e "Choose your web project to change directories to:"
echo -e ""

sites_root="${HOME}/Sites"
site_paths="${sites_root}/*"

index=1
for site_path in $site_paths; do

	site_domain=$(basename "${site_path}")
	domain_ext=$(file_extension "${site_domain}")
	if [ "dev" == "${domain_ext}" ]; then
		site_domains[$index]="${site_domain}"
		if [ $index -lt 10 ];then 
			echo -e "\t${index}.) ${site_domain}"
		else 
			alpha=$(chr $(( index+87 )))
			echo -e "\t${alpha}.) ${site_domain}"
		fi
		index=$(( $index+1 ))
	fi
done
echo -e ""
read -p "Select one, or space for none: " -n 1 choice
if [ "" == "${choice}" ];then 
	cd "${save_dir}"
else
	if [ "" == "${site_domains[choice]}" ];then 
		choice=$(ord "${choice}")
		choice=$(( $choice-87 ))
	fi
	if [ $choice -ne 0 ]; then
		cd "${sites_root}/${site_domains[choice]}"
		clear
	fi
fi

# echo "${START_DIR}"
# if [ "" != "${START_DIR}" ]; then
# 	cd "${START_DIR}"
# 	clear
# fi


