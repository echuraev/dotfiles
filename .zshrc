if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load

# Load theme
[ -f $HOME/.zsh/colors/theme.zsh ] && source $HOME/.zsh/colors/theme.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
setopt extended_history
setopt inc_append_history
#setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt noincappendhistory
setopt nosharehistory

# Vim Mode
bindkey -v
bindkey -a '^[[3~' delete-char
vim_ins_mode="%{$fg[yellow]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[cyan]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
        vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
            zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
        vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

[ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
