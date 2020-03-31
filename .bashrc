if [ -x "$(command -v zsh)"  ]; then
    exec zsh
else
    [ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
    [ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    set -o vi
fi
