#!/usr/bin/env bash

#
# Display Git stuff in my prompt
#
# From http://slacy.com/blog/2012/06/supercharge-your-bash-prompt-with-git-status-goodness/
#
# TODO: Change repo to "{org}/{repo}" for origin (fetch)
#
#       git remote -v | grep "(fetch)" | grep "origin"
#
echo "Running .dotfiles/bash/010-prompt.sh..."

function _get_project_json() {
    local dir="$(pwd)"
    until [ "/" == "${dir}" ] ; do
        if [ -f "${dir}/project.json" ] ; then
            echo "$(cat "${dir}/project.json")"
            break
        fi
        dir="$(dirname "${dir}")"
    done
}

function _get_git_dir() {
    local dir="$(pwd)"
    until [ "/" == "${dir}" ] ; do
        if [ -d "${dir}/.git" ] ; then
            echo "${dir}/.git"
            break
        fi
        dir="$(dirname "${dir}")"
    done
}

function dev_prompt {
    local reset='\[\e[00m\]'
    local bold='\[\e[01m\]'
    local red='\[\e[31m\]'
    local green='\[\e[32m\]'
    local yellow='\[\e[33m\]'
    local blue='\[\e[34m\]'
    local purple='\[\e[35m\]'
    local cyan='\[\e[36m\]'
    local gray='\[\e[37m\]'
    local bright='\[\e[39m\]'
    local bc="${bold}${cyan}"
    local bg="${bold}${green}"
    local by="${bold}${yellow}"
    local br="${bold}${red}"
    local bb="${bold}${blue}"
    local r="${reset}"
    local git=""
    local dir

    if [ "$PWD" == "/" ]; then
        dir="/"
    else
        dir="\w/"
    fi
    git_dir="$(_get_git_dir)"
    if [ -d "${git_dir}" ]; then

        pushd "${git_dir}" > /dev/null

        local branch="$(git branch --no-color | grep "*" | cut -c3-999 2>&1)"
        local hash="$(git log -1 --oneline --no-color|awk '{print $1}' 2>&1)"
        local tag="$(git describe --exact-match "${hash}" 2>&1)"

        if ! [[ "" == "${tag}" || "${tag}" =~ ^fatal ]]; then
            git="${br}tag${r}=${bg}${tag}${r} (detached)"
        elif [ "(HEAD detached at" == "${branch:0:17}" ]; then
            if [ "" != "${git}" ]; then
                git=", ${git}"
            fi
            git="${br}HEAD${reset}=${bg}${hash}${r} (detached)${git}"
        elif [ "" != "${branch}" ] ; then
            git="${git}${br}branch${reset}=${bg}${branch}${r}"
        else
            git=""
        fi

        local remote="$(git config --get "branch.${branch}.remote")"
        if ! [[ "" == "${remote}" || "${remote}" =~ ^fatal ]]; then
            if [ "" != "${git}" ]; then
                git="${git}, "
            fi
            git="${git}${br}remote${r}=${bg}${remote}${r}"
        fi

        local repo="$(basename "$(git config --get "remote.${remote}.url")")"
        if [ "" != "${repo}" ]; then
            if [ "" != "${git}" ]; then
                git=", ${git}"
            fi
            git="${br}repo${r}=${bg}${repo}${r}${git}"
        fi

        if [ "" != "${git}" ]; then
            git="${bb}GIT:${r}     ${git}\n"
        fi

        popd > /dev/null

    fi

    json="$(_get_project_json)"
    if [ "" == "${json}" ]; then
        project=""
    else
        project="$(echo $json|jq -r '.hostname')"
    fi

    if [ "" != "${project}" ]; then
        project="${bb}Project:${r} ${br}host${r}=${bg}${project}${r}"
    fi

    if [[ "" != "${project}" && "" != "${git}" ]]; then
        project="${project}\n"
    fi

    dir="${bc}${dir}\n"

    PS1="\n${git}${project}${dir}${reset}${green}\$${reset} "

}

PROMPT_COMMAND=dev_prompt
