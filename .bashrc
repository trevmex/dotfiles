export NODE_PATH=$HOME/local/node

# Colorize the Terminal
export CLICOLOR=1;

export M2_HOME=/usr/local/maven

export M2=$M2_HOME/bin

export TOMCAT_HOME=/usr/local/tomcat

export TOMCAT=$TOMCAT_HOME/bin

export PATH=$M2:$TOMCAT:$HOME/local/node/bin:/Users/tmenag200/Code/PhoneDev/android-sdk-mac_x86/tools:/Users/tmenag200/Code/PhoneDev/android-sdk-mac_x86/platform-tools:/Users/tmenag200/Code/PhoneDev/Cordova:/usr/local/sbin:/Applications/Firefox\ 3.6.app/Contents/MacOS:$PATH

export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar:/Users/tmenag200/Code/CIM/envjasmine/lib/rhino/js.jar

export GREP_OPTIONS='--color=auto' # Add color to grep

export CDPATH=.:~:~/Documents:~/Code:~/Code/CIM:~/Code/CIM/xtv:~/Code/CIM/xtv/xtv-trunk:~/Code/CIM/portalds:~/Code/CIM/portalds/portalds-trunk:/usr/local:/Volumes # cd will now look in all these directories, instead of just .

export HISTIGNORE="&:ls:l:[bf]g:exit" # Ignore certail non-important commands in the history

shopt -s cdspell # Correct minor spelling errors in cd

shopt -s dotglob # Allow files starting with dot (.) to be returned in path name expansion

shopt -s extglob # Extend pattern matching in bash to use regexp (?*+@!)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

alias l="ls -AlF"
alias count_cukes='grep -R "^[^#]*Scenario" * | grep -v "svn-base" | wc -l'

# changing directory to code project
function c { cd ~/Code/$1; }
if [ -f /usr/local/Cellar/bash-completion/1.2/etc/bash_completion ]; then
  . /usr/local/Cellar/bash-completion/1.2/etc/bash_completion # Add bash completion (http://www.caliban.org/bash/#completion)
fi

function up_and_test_fancast {
    cd xtv-trunk && svn up && cd cTV && ./test_js.sh
}

function up_and_test_portalds {
    cd portalds-trunk && svn up && ./test_js.sh
}

function up_and_test_cimspire {
    cd cimspire && svn up && cd trunk && ./test_js.sh
}

function up_and_run {
    screen -t xtv 1 bash -c "cd xtv-trunk && svn up && cd cTV && ./runserver.sh -P"
    screen -t pds 2 bash -c "cd portalds-trunk && svn up && ./runserver.sh"
}

export PS1='\u@\h:\W$ ' # Add the git branch to the prompt
