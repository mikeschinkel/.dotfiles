#!/bin/bash
#

echo "Running .dotfiles/bash/050-funcs.sh..."


cd..() {
    cd ..
}

chx() {
    chmod +x $1
}

lch() {
	stat -f "%OLp" $1
}