if [ -f ~/.bashrc ]; then
  . ~/.bashrc # execute the ~/.bashrc file
fi

screen -r -d || screen -q -U
exit
