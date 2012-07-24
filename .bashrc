#!/usr/bin/env bash

#
# Exports
#

export CLICOLOR=1                      # Colorize the Terminal
export GREP_OPTIONS='--color=auto'     # Add color to grep
export CDPATH=.:~:~/Documents:/Volumes # cd will now look in all these directories, instead of just .
export HISTIGNORE="&:ls:l:[bf]g:exit"  # Ignore certail non-important commands in the history

#
# Shell Options
#

shopt -s cdspell # Correct minor spelling errors in cd
shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion
shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

#
# Aliases
#

alias l="ls -AlF"
alias up="~/.scripts/up" # Typing 'up' will update your svn OR git repo, if you are in one

#
# Bash Completion
#

if [ -f /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion # Add bash completion (requires `brew install bash-completion`)
fi

#
# Colors
#
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NORMAL="\[\033[0m\]"

#
# Prompt Setup
#
function parse_git_in_rebase {
  [[ -d .git/rebase-apply ]] && echo " REBASING"
}

function parse_git_branch {
  branch=$(git branch|grep "*"|sed -e s/^..//g 2> /dev/null) || return
  echo " ("${branch}$(parse_git_dirty)$(parse_git_in_rebase)")"
}

function parse_svn_repo() { # Display svn info
  info=$(svn info 2> /dev/null) || return
  root=$(echo $info | sed -e 's/^.*Repository Root: //g' -e 's,.*/,,g' -e 's/ .*//g')
  revision=$(echo $info | sed -e 's/^.*Revision: //g' -e 's/ .*//g')
  echo " ($root:$revision)"
}

export PS1="$RED\u@\h:$GREEN\W$YELLOW\$(parse_git_branch)\$(parse_svn_repo)$NORMAL\$ " # Add the git and svn info to the prompt
