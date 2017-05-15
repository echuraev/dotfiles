if type "zsh" > /dev/null; then
    exec zsh
else
    [ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
    [ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi
