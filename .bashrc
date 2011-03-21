export GREP_OPTIONS='--color=auto' # Add color to grep

export CDPATH=.:~:~/Documents:~/Code:/Volumes # cd will now look in all these directories, instead of just .

export HISTIGNORE="&:ls:l:[bf]g:exit" # Ignore certail non-important commands in the history

shopt -s cdspell # Correct minor spelling errors in cd

shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion

shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias l="ls -AlF"

if [ -f /usr/local/Cellar/bash-completion/1.2/etc/bash_completion ]; then
  . /usr/local/Cellar/bash-completion/1.2/etc/bash_completion # Add bash completion (http://www.caliban.org/bash/#completion)
fi
