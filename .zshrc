if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
if [[ ! -d ~/.oh-my-zsh ]];then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

#source ~/.zplug/init.zsh
#
#zplug "plugins/git", from:oh-my-zsh, if:"which git"         # Git plugin from oh-my-zsh
#zplug "zsh-users/zsh-syntax-highlighting", defer:2          # Syntax highlighting for commands
#zplug "lib/completion", from:oh-my-zsh                      # Load completion library for those sweet [tab] squares
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'       # Manage zplug as other plugins
#
#zplug load

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="muse"
plugins=(git autojump command-not-found)
source $ZSH/oh-my-zsh.sh

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

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Vim Mode
bindkey -v
KEYTIMEOUT=1
bindkey -a '^[[3~' delete-char
setopt +o nomatch # Allow * commands i.g.: rm -f *
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

PROMPT='%{$PROMPT_SUCCESS_COLOR%}%n@%m%{$reset_color%}:%{$PROMPT_SUCCESS_COLOR%}%c%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} '
RPROMPT='${vim_mode} %D{%d %b %Y} %T' # See man page strftime(3) for more details.

# Load theme
#[ -f $HOME/.zsh/colors/theme.zsh ] && source $HOME/.zsh/colors/theme.zsh

[ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
