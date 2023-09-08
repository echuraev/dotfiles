#  zinit configuration {{{ #
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Syntax highlighting for commands better in compare with zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
# Load completion library for those sweet [tab] squares
zinit snippet OMZ::lib/completion.zsh
# Suggests package name with relevant command
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# 'x' alias - swiss knife for archive extracting
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
# Print time after long command
zinit light popstas/zsh-command-time
# Create and navigate in bookmarks in Bash and Zsh
zinit light urbainvaes/fzf-marks

autoload compinit
compinit

#zplug load
#  }}} zinit configuration #
#  zsh-command-time configs {{{ #
ZSH_COMMAND_TIME_ECHO=1           # Show time
ZSH_COMMAND_TIME_MIN_SECONDS=3    # if command executes more than 3 seconds, time will shown
ZSH_COMMAND_TIME_MSG="Execution time: %s"
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours h. $min min. $sec s."
            else
                timer_show="$fg[red]$min min. $sec s."
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
#  }}} zsh-command-time configs #
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
setopt extended_history
setopt inc_append_history
#setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
#setopt noincappendhistory
#setopt nosharehistory
setopt interactivecomments # bash style comments
setopt autocd
# Correction
setopt correct
setopt +o nomatch # Allow * commands i.g.: rm -f *
#  fg workaround {{{ #
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}
#  }}} fg workaround #

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
#  vim mode {{{ #
bindkey -v
KEYTIMEOUT=1
bindkey -a '^[[3~' delete-char
bindkey -v '^?' backward-delete-char
# Enabled history filtering
# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward
#  }}} vim mode #

# Load theme
[ -f $HOME/.zsh/colors/theme.zsh ] && source $HOME/.zsh/colors/theme.zsh
# Load local bash configuration
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
# Load local zsh configuration
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# Load configuration
[ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^G' jump           # key binding for run fzf-marks
compdef _cp cpv

