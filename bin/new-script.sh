#!/usr/bin/env bash

new_script="${DOTFILES_DIR}/$1.sh"
echo "Create new script ${new_script}..."
sudo echo '#!/usr/bin/env bash' > ${new_script}
sudo echo "" >> ${new_script}
sudo echo $2 >> ${new_script}
