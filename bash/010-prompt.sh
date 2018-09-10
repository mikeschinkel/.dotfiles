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
        local r="${reset}"
        local git=""
        local dir

        if [ "$PWD" == "/" ]; then
            dir="/"
        else
            dir="\w/"
        fi

        if [ -d "$(pwd)/.git" ]; then
            local branch="$(git branch --no-color | grep "*" | cut -c3-999 2>&1)"
            local hash="$(git log -1 --oneline --no-color|awk '{print $1}' 2>&1)"

            local tag="$(git describe --exact-match "${hash}" 2>&1)"
            if ! [[ "" == "${tag}" || "${tag}" =~ ^fatal ]]; then
                git="${br}tag${r}=${bg}${tag}${r}"
            fi

            if [ "(HEAD detached at" == "${branch:0:17}" ]; then
                if [ "" != "${git}" ]; then
                    git=", ${git}"
                fi
                git="${br}HEAD${reset}=${bg}${branch:18:8}${r} (detached)${git}"
            elif [ "" != "${branch}" ] ; then
                git="${git}${br}branch${reset}=${bg}${branch}${r}"
            else
                git=""
            fi

            local remote="$(git remote 2>&1)"
            if ! [[ "" == "${remote}" || "${remote}" =~ ^fatal ]]; then
                if [ "" != "${git}" ]; then
                    git="${git}, "
                fi
                git="${git}${br}remote${r}=${bg}${remote}${r}"
            fi

            if [ "" != "${git}" ]; then
                git="${by}GIT:${r} ${git}\n"
            fi
        fi

        dir="${bc}${dir} \n"

        PS1="\n${git}${dir}${reset}${green}\$${reset} "

    }

    PROMPT_COMMAND=dev_prompt


      # httpd="${purple}apache[${reset}${cyan}"
      # running=$(ps ax | grep -v grep | grep httpd)
      # if  [ "${running}" == "" ]; then
      #     httpd="${httpd}off"
      # else
      #     httpd="${httpd}ON"
      # fi
      # httpd="${httpd}${reset}${purple}]${reset}"
