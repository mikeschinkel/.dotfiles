#!/usr/bin/env bash

NEW_SCRIPT="${DOTFILES}/$1.sh"
echo "Create new script ${NEW_SCRIPT}..."
sudo echo '#!/usr/bin/env bash' > ${NEW_SCRIPT}
sudo echo "" >> ${NEW_SCRIPT}
sudo echo $2 >> ${NEW_SCRIPT}
