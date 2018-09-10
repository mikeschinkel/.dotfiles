#!/bin/bash
#

echo "Running .dotfiles/bash/050-funcs.sh..."

isEcho() {
    if [[ "1" == "$#" && '--echo' == "$1" ]] ; then 
        return 0 
    fi
    return 1
}

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

#
# Converts a single character to an ASCII ordinal number
#
# $1 - Char
#
# Usage: $number=$(ord "A")
#   Result: $number ==> 65
#
#
function ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

#
# Converts an ASCII ordinal number into a character
#
# $1 - Number
#
# Usage: $char=$(chr 65)
#   Result: $char ==> "A"
#
#
function chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

#
# Outputs the file extension given a file name
#
# $1 - String
#
# Usage: string=$(to_lowercase "FOO.BAR")
#   Result: $string ==> "foo.bar"
#
#
function to_lowercase() {
    echo "${1,,}"
}

#
# Outputs the file extension given a file name
#
# $1 - Filename
#
# Usage: extension=$(file_extension "foo/bar.baz")
#   Result: $extension ==> "baz"
#
#
function file_extension() {
    echo "${1##*.}"
}

#
# Outputs the base filename given a full filename
# Base filename means no path and no extension
#
# $1 - Filename
#
# Usage: basename=$(file_basename "foo/bar.baz")
#   Result: $basename ==> "bar"
#
function file_basename() {
    filename=$(basename "$1")
    echo "${filename%.*}"
}

#
# Returns a filename that does not exist given an existing filename.
#
# $1 - The backup file, e.g.  /vagrant/sql/backup.sql
#
# Outputs: The new file name in the form of {previous}{n}.{ext} where:
#
#       {previous} - Root filename for backup, e.g. /vagrant/sql/backup
#       {n}        - Ordinal position for prior backups, e.g. 1, 2, 3, etc
#       {ext}      - The file extension, e.g. sql
#
# Usage:  newbakfile=$(next_backup_file "${file_to_backup}")
#
function next_backup_file() {
    bakfile="$1"

    #
    # Get the file extension if there is one
    # See: http://stackoverflow.com/a/965072/102699
    #
    ext=$(file_extension "${bakfile}")
    if [[ "" == "${ext}" || "${ext}" == "${bakfile}" ]]; then
        ext=""
    fi


    #
    # Get the filepath sans extension
    # See: http://stackoverflow.com/a/965072/102699
    #
    bakfile="${bakfile%.*}"

    #
    # Now check to see if the default prior backup exists
    # Continue checking until we find a workable filename
    #
    test="${bakfile}.${ext}"
    until [ ! -e "${test}" ]; do
        counter=$((counter))
        let counter++
        test="${bakfile}${counter}.${ext}"
    done
    echo "${test}"
}

function is_dry_run() {
    if [[ "$1" == *"--dry-run"* ]]; then
        echo "true"
        return
    fi
    echo "false"
}

function is_quiet() {
    if [[ "$1" == *"--quiet"* ]]; then
        echo "true"
        return
    fi
    echo "false"
}

#
# Generate output if -q|--quiet not in a string passed as $1.
#
# $1 - Always "$*", e.g. string containing parameters passed to the calling script
# $2 - String to echo if not quiet. Prefix string w/"=", "^", "&" or "=" to effect before and after echos.
#
function echo_if_not_quiet() {
    if [ "true" != $(is_quiet "$1") ]; then
        regex="s/\\\n/\n/g"
        control=${2:0:1}
        message=${2:1}
        case "${control}" in
            "^")
                echo -e "${message}" | sed "${regex}"
                echo
                ;;
            "*")
                echo
                echo -e "${message}" | sed "${regex}"
                echo
                ;;
            "=")
                echo -e "${message}" | sed "${regex}"
                ;;
            "&")
                echo
                echo -e "${message}" | sed "${regex}"
                ;;
            *)
                echo
                echo "CODING ERROR:"
                echo "Your message for echo_if_not_quiet() does not begin with one of: ^, *, = or &."
                echo
                ;;
        esac
    fi
}


#
# Check the "--force" option. If not set, output error message
#
# $1 - Always "$*", e.g. string containing parameters passed to the calling script
# $2 - Error message or optionally output
#

function exit_if_no_force_option() {
    if [[ "$1" != *"--force"* ]]; then
        echo "ERROR: $2. Cannot continue."
        echo
        echo -e "\tUse --force to force continue."
        echo
        exit
    fi
}

#
# Echos the substring after a character
#
# $1 - String
# $2 - Character
#
# Usage: vendor_dir=$(substring_after "www/vendor" "/")
#   Result: $vendor_dir ==> "vendor"
#
#
function substring_after() {
    string="$1"
    character="$2"
    echo "${string#*${character}}"
}

#
# Runs Git commands, quietly, unless they fail
#
# See http://stackoverflow.com/a/8944284/102699
#
function quiet_git() {
    stdout=$(tempfile)
    stderr=$(tempfile)

    if ! git "$@" </dev/null >$stdout 2>$stderr; then
        cat $stderr >&2
        rm -f $stdout $stderr
        return 1
    fi

    rm -f $stdout $stderr
}

function git_commit_with_message() {
    git commit -m "$*"
}

function find_root_grep() {
    sudo find / | grep -i "$1"
}

function find_home_grep() {
    find ~/ | grep -i "$1"
}

function find_grep() {
    sudo find . | grep -i "$1"
}

function perms() {
    local path
    if [ 1 == $# ] ; then
        path="$1"
        path="${path%/}/"
    else            
        path=''
    fi
    # See https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/stat.1.html
    stat -f '%5A%t%SA%t%N' "${path}"*
}

