[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

if [ -f ~/.zplug/log/job.lock ]; then
    echo "Remove lock file!"
    rm -f ~/.zplug/log/job.lock
fi

source ~/.zplug/init.zsh

zplug "zdharma/fast-syntax-highlighting", defer:2           # Syntax highlighting for commands better in compare with zsh-syntax-highlighting
zplug "lib/completion", from:oh-my-zsh                      # Load completion library for those sweet [tab] squares
zplug 'zplug/zplug', hook-build:'zplug --self-manage'       # Manage zplug as other plugins
zplug "plugins/colored-man-pages", from:oh-my-zsh           # Add colors to man pages
zplug "plugins/command-not-found", from:oh-my-zsh           # Suggests package name with relevant command
zplug "plugins/extract", from:oh-my-zsh                     # 'x' alias - swiss knife for archive extracting
zplug "nviennot/zsh-vim-plugin"                             # Allows you to do vim filename:123 to open a file with the cursor at a specific line.
zplug "popstas/zsh-command-time"                            # Print time after long command
zplug "urbainvaes/fzf-marks"                                # Create and navigate in bookmarks in Bash and Zsh

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

#  zsh-command-time configs {{{ #
ZSH_COMMAND_TIME_ECHO=1           # Show time
ZSH_COMMAND_TIME_MIN_SECONDS=3    # if command executes more than 3 seconds, time will shown
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            echo "Execution time: $fg[green]$ZSH_COMMAND_TIME s."
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            echo "Execution time: $fg[yellow]$min min. $sec s."
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                echo "Execution time: $fg[red]$hours h. $min min. $sec s."
            else
                echo "Execution time: $fg[red]$min min. $sec s."
            fi
        fi
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
setopt noincappendhistory
setopt nosharehistory
setopt interactivecomments # bash style comments
setopt autocd
# Correction
setopt correct
setopt +o nomatch # Allow * commands i.g.: rm -f *

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Vim Mode
bindkey -v
KEYTIMEOUT=1
bindkey -a '^[[3~' delete-char
# Enabled history filtering
# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward

# Load theme
[ -f $HOME/.zsh/colors/theme.zsh ] && source $HOME/.zsh/colors/theme.zsh

# Load configuration
[ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^G' jump           # key binding for run fzf-marks
compdef _cp cpv

