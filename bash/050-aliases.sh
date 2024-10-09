#!/bin/bash
#
#

echo "Running .dotfiles/bash/055-aliases.sh..."

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdp=cd_projects

#
# Systemd
#
alias jc='sudo journalctl '
alias sc='sudo systemctl '

#
# k8s
#
# shellcheck disable=SC2142
alias kpod='f() { k get pods -n edt -o json | jq -r '\''.items[]|select(.metadata.labels.app="$1")|.metadata.name'\'' | head -n 1; }; f'

# shellcheck disable=SC2142
alias kn='f() { [ "$1" ] && sudo kubectl config set-context --current --namespace $1 || sudo kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

alias kall='k get all -A | less'

# shellcheck disable=SC2142
alias kn='f() { [ "$1" ] && sudo kubectl config set-context --current --namespace $1 || sudo kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

alias k='kubectl'
alias ka='kubectl apply -f'
alias kc='kubectl create '
alias kd='kubectl delete -f'

# shellcheck disable=SC2142
alias kns='f() { [ "$1" == "-" ] && unset KNS || if [ -z "$1" ]; then echo "${KNS}" ; else  export KNS="-n $1" ; fi ; } ; f'
# shellcheck disable=SC2142
alias kmake='f() { kubectl run -it $KNS "$1" --image=debian -- bash ; } ; f'
# shellcheck disable=SC2142
alias kdel='f() { kubectl delete pod $KNS $(kpod "$1") ; } ; f'
# shellcheck disable=SC2142
alias kedit='f() { kubectl edit pod $KNS $(kpod "$1") ; } ; f'
# shellcheck disable=SC2142
alias kexec='f() { k exec -it "$1" -- bash; } ; f'

# shellcheck disable=SC2142
alias kx='f() { [ "$1" ] && sudo kubectl config use-context $1 || sudo kubectl config current-context ; } ; f'
# shellcheck disable=SC2142
alias kdesc='f() { k describe $KNS pod $(kpod "$1"); } ; f'

function khelp {
	echo "k <...>      — kubectl"
	echo "kall         — List all K8s objects, e.g. k get all -A | less"
	echo "kn [<ns>]    — Get or set namespace via 'kubectl config set-context --current --namespace <ns>'"
	echo "kx [<ctx>]   — Get or set namespace via 'kubectl config use-context <ctx>"
	echo "ka <yaml>    — kubectl apply -f"
	echo "kc <...>     — kubectl create"
	echo "kd <yaml>    — kubectl delete -f"
	echo "kns [<ns>|-] — Get or set namespace as \$KNS variable (for these aliases that require namespace)"
	echo "kmake <pod>  — kubectl run <pod> \$KNS in bash on Debian"
	echo "kedit <pod>  — kubectl edit <pod> \$KNS"
	echo "kexec <pod>  — kubectl exec <pod> \$KNS"
	echo "kdel <pod>   — kubectl delete <pod> \$KNS"
	echo "kdesc <pod>  — kubectl describe <pod> \$KNS"
}

#
# NetCat Send & Receive
#
alias rcv='netcat -l -p 12345'
alias snd='pbpaste|netcat 192.168.1.10 12345'

#
# Git
#
alias grs="git reset --soft"
alias grh="git reset --soft"
alias gs="git status"
alias gpl="git pull"
alias gps="git push"
alias gcm=git_commit_with_message
alias gl="git log"
alias glo="git log --oneline -20"
alias gitunshelf="git rm -r --cached ."
alias gitshelf="git add ."

git config --global alias.tags 'tag -n99'

#
# Find from Root with Grep
#
alias frg=find_root_grep

#
# Find from Home with Grep
#
alias fhg=find_home_grep

#
# Just Find '.' with Grep
#
alias f=find_grep

alias largest-files='find . -type f -exec du -a {} + | sort -n -r | head -n 20'


alias move-downloads="rsync -avzh --remove-source-files --progress ~/Downloads/ /Volumes/JetDrive/Downloads && find ~/Downloads -type d -empty -delete"

# Make Bash use the one from Homebrew
alias rsync='/usr/local/bin/rsync'

#Now output the aliases we have so we don't forget about them.
printf "\n  ALIASES:\n%s\n\n" "$(alias|awk '{$1=""; sub(/^ /,"    "); print}')"
