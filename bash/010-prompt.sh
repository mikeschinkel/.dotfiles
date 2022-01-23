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
    local dir
    dir="$(pwd)"
    until [ "/" == "${dir}" ] ; do
        if [ -f "${dir}/project.json" ] ; then
            echo "$(cat "${dir}/project.json")"
            break
        fi
        dir="$(dirname "${dir}")"
    done
}

function _get_git_dir() {
    local dir
    dir="$(pwd)"
    until [ "/" == "${dir}" ] ; do
        if [ -d "${dir}/.git" ] ; then
            echo "${dir}/.git"
            break
        fi
        dir="$(dirname "${dir}")"
    done
}

function _get_go_mod() {
    local dir
    dir="$(pwd)"
    until [ "/" == "${dir}" ] ; do
        if [ -f "${dir}/go.mod" ] ; then
            echo "${dir}/go.mod"
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
    local detatched="(detached)"
    local dir branch hash tag remote extra repo head remote_url pushed hostname go_mod module firstword project

    if [ "$PWD" == "/" ]; then
        dir="/"
    else
        dir="\w/"
    fi
    pushed=0
    git_dir="$(_get_git_dir)"
    if [ -d "${git_dir}" ]; then

        if pushd "${git_dir}" >/dev/null 2>&1; then
          pushed=1
        fi

        branch="$(git branch --no-color 2>&1 | head -n 1 | awk '{print$2}')"
        hash="$(git log -1 --oneline --no-color 2>&1|awk '{print $1}' 2>&1)"

        if [ "fatal:" != "${hash}" ]; then
            tag="$(git describe --exact-match "${hash}" 2>&1)"
            remote="$(git config --get "branch.${branch}.remote")"
        else
            tag=""
            remote=""
        fi

        if [ "" == "${remote}" ]; then
            remote="origin"
        fi

        remote_url="$(git remote -v | grep "${remote}" | grep '(push)' | awk '{print $2}')"
        extra=" (push=>${cyan}${remote_url}${r})"

        repo="$(basename "$(git config --get "remote.${remote}.url"  2>/dev/null)")"
        if [ "" == "${repo}" ]; then
            repo="$(basename "${remote}")"
            repo="${repo%.git}"
        fi

        if [[ "" == "${branch}" || "(HEAD" == "${branch:0:5}" ]] ; then
            if ! [[ "" == "${tag}" || "${tag:0:5}" == "fatal" ]]; then
                branch="${detatched}"
            fi
        fi

        if [ "(HEAD detached at" == "${branch:0:17}" ]; then
            head="${hash}"
            branch="${detatched}"
        fi

        if [ "" != "${repo}" ]; then
            git="${br}repo${r}=${bg}${repo%.git}${r}${git}"
        fi

        if [ "" != "${branch}" ]; then
            if [ "" != "${git}" ]; then
                git="${git} "
            fi
            git="${git}${br}branch${r}=${bg}${branch}${r}"
        fi

        if ! [[ "" == "${tag}" || "${tag}" =~ ^fatal ]]; then
            if [ "" != "${git}" ]; then
                git="${git} "
            fi
            git="${git}${br}tag${r}=${bg}${tag}${r}"
        fi

        if [ "" != "${head}" ]; then
            if [ "" != "${git}" ]; then
                git="${git} "
            fi
            git="${git}${br}HEAD${reset}=${bg}${head}${r}"
        fi

        if ! [[ "" == "${remote}" || "${remote}" =~ ^fatal ]]; then
            if [ "" != "${git}" ]; then
                git="${git} "
            fi
            git="${git}${br}remote${r}=${bg}${remote}${r}${r}${extra}"
        fi

        if [ "" != "${git}" ]; then
            git="${bb}GIT${r}: ${git}\n"
        fi

        if [ $pushed -eq 1 ]; then
          popd > /dev/null 2>&1 || echo >/dev/null
        fi

    fi

    go_mod="$(_get_go_mod)"

    echo $module

    if [ ! -f "${go_mod}" ]; then
      module=""
    else
      module="$(grep -m 1 . "${go_mod}")"
      firstword="$(echo "${module}"|awk '{print$1}')"
      if [ "${firstword}" != "module" ]; then
        module=""
      else
        module="$(echo "${module}"|awk '{print$2}')"
        if [ "${module}" != "" ]; then
            project="${bb}Go${r}: ${br}module${r}=${bg}${module}${r}"
        fi
      fi
    fi

    json="$(_get_project_json)"
    if [ "" != "${json}" ]; then
        hostname="$(echo $json|jq -r '.hostname')"
        project="${bb}Project${r}: ${br}host${r}=${bg}${hostname}${r}"
    fi

    if [[ "" != "${project}" && "" != "${git}" ]]; then
        project="${project}\n"
    fi

    dir="${bc}${dir}\n"

    PS1="\n${project}${git}${dir}${reset}${green}\$${reset} "

}

PROMPT_COMMAND=dev_prompt
