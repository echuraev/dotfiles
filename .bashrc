case $- in
    *i*) ;;
    *) return;; # don't do anything then non-interactive shell
esac

if [ -x "$(command -v zsh)"  ]; then
    exec zsh
else
    [ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
    [ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
    eval "$(fzf --bash)"

    set -o vi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
