# change to vi edit mode
set -o vi

shopt -s cdspell # Correct minor spelling errors in cd

shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion

shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

# Source all our bash confs
for SCRIPT in "$HOME/.bashconf/*"; do
    [[ -s "$SCRIPT" ]] && source "$SCRIPT"
done

if [ -f /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion # Add bash completion (requires `brew install bash-completion`)
fi
