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

    # Press Ctrl+X Ctrl+E to edit command in text editor
    bind '"\C-x\C-e": edit-and-execute-command'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
