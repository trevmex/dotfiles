# VI key binding for the terminal
set -o vi

# Set up the Maven environment
export M2_HOME=/usr/local/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

export GREP_OPTIONS='--color=auto' # Add color to grep

export CDPATH=.:~:~/Documents:~/Documents/Aptana\ Studio\ Workspace:~/Documents/Aptana\ Studio\ Workspace/trunk:~/Documents/Aptana\ Studio\ Workspace/trunk/webapp:~/Code:~/Code/CIM:~/Code/PAAL:~/Code/PERSONAL:/usr/lib:/usr/local:/Volumes # cd will now look in all these directories, instead of just .

export HISTIGNORE="&:ls:l:[bf]g:exit" # Ignore certail non-important commands in the history

shopt -s cdspell # Correct minor spelling errors in cd

shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion

shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias l="ls -AlF"

function pgrep() {
grep -nR "${1}" * | grep -v "^Binary file" | grep -v "^src/test" | grep -v ".svn" | grep -v ".swp"
}

# changing directory to code project
function c { cd ~/Code/$1; }
if [ -f /usr/local/Cellar/bash-completion/1.2/etc/bash_completion ]; then
  . /usr/local/Cellar/bash-completion/1.2/etc/bash_completion # Add bash completion (http://www.caliban.org/bash/#completion)
fi
source ~/.svn-completion.sh # Add svn completion
source ~/.git-completion.sh # Add git completion
source ~/.git_svn_ps1.sh # Add git/svn to the prompt

export SVN_SHOWDIRTYSTATE=1 # make the SVN prompt change if dirty

export PS1='\u@\h:\W\[\033[01;33m\]$(__git_svn_ps1)\[\033[00m\]$ ' # Add the git branch to the prompt
