# See more here: https://dustri.org/b/my-zsh-configuration.html

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="muse"

plugins=(git autojump command-not-found)

setopt +o nomatch # Allow * commands i.g.: rm -f *
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

PROMPT='%{$PROMPT_SUCCESS_COLOR%}%n@%m%{$reset_color%}:%{$PROMPT_SUCCESS_COLOR%}%c%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} '
RPROMPT='${vim_mode} %D{%d %b %Y} %T' # See man page strftime(3) for more details.

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
