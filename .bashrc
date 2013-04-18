# change to vi edit mode
set -o vi

# Colorize the Terminal
export CLICOLOR=1;

export M2_HOME=/usr/local/maven

export M2=$M2_HOME/bin

export TOMCAT_HOME=/usr/local/tomcat

export TOMCAT=$TOMCAT_HOME/bin

export PATH=$M2:$TOMCAT:/usr/local/sbin:$PATH

export GREP_OPTIONS='--color=auto' # Add color to grep

export CDPATH=.:~:~/Documents:~/Code:~/Code/CIM:/usr/local:/Volumes # cd will now look in all these directories, instead of just .

export HISTIGNORE="&:ls:l:[bf]g:exit" # Ignore certail non-important commands in the history

export SBTOPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=384M"

export JAVA_OPTS="-Xms1256m -Xmx1512m -XX:MaxPermSize=256m"

export MAVEN_OPTS="-Xmx2024m -XX:MaxPermSize=512m"

shopt -s cdspell # Correct minor spelling errors in cd

shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion

shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias l="ls -AlF"
alias up="~/.scripts/up"
alias "svn-to-git"="~/.scripts/svn-to-git"

function eclipseup() {
    mvn eclipse:eclipse && mkdir -p target/generated-resources/eclipse
}

function upa() {
    for l in *
    do
        if [ -d "$l" ]; then
            echo "Updating $l"
            cd "$l" >/dev/null
            up >/dev/null
            cd ..
        fi
    done
}

if [ -f /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion # Add bash completion (requires `brew install bash-completion`)
fi

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NORMAL="\[\033[0m\]"

function parse_git_in_rebase {
  [[ -d .git/rebase-apply ]] && echo " REBASING"
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  branch=$(git branch 2> /dev/null | grep "*" | sed -e s/^..//g)
  if [[ -z ${branch} ]]; then
    return
  fi
  echo " ("${branch}$(parse_git_dirty)$(parse_git_in_rebase)")"
}

function parse_svn_repo {
  info=$(svn info 2> /dev/null) || return
  root=$(echo $info | sed -e 's/^.*Repository Root: //g' -e 's,.*/,,g' -e 's/ .*//g')
  revision=$(echo $info | sed -e 's/^.*Revision: //g' -e 's/ .*//g')
  echo " ($root:$revision)"
}

export PS1="$RED\u@\h:$GREEN\W$YELLOW\$(parse_git_branch)\$(parse_svn_repo)$NORMAL\$ " # Add the git branch to the prompt

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

echo 'sleep 1' >> ~/.bashrc
