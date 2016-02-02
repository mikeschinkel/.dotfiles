#!/bin/bash
#

cd..() {
    cd ..
}

chx() {
    chmod +x $1
}

lch() {
	stat -f "%OLp" $1
}