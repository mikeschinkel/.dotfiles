#!/bin/bash
#

echo "Running .dotfiles/bash/050-funcs.sh..."

mcd() {
    mkdir "$1"
    cd "$1"

}

ll() {
    ls -al $1 $2 $3 $4 $5
}

gc() {
    git clone "$1"
}

cd..() {
    cd ..
}

chx() {
    chmod +x $1
}

lch() {
	stat -f "%OLp" $1
}

# The ones below come from:
# 
#	http://apple.stackexchange.com/a/96810/684
#
#

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

cman() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

gitssh(){
    trap 'rm -f /tmp/.git_ssh.$$' 0
    SSH_KEY="~/.ssh/id_rsa"
    echo "ssh -i $SSH_KEY \$@" > /tmp/.git_ssh.$$
    chmod +x /tmp/.git_ssh.$$
    export GIT_SSH=/tmp/.git_ssh.$$
    [ "$1" = "git" ] && shift
    git "$@"
}

ccat() {
    local out colored
    out=$(/bin/cat $@)
    colored=$(echo $out | pygmentize -f console -g 2>/dev/null)
    [[ -n $colored ]] && echo "$colored" || echo "$out"
}

