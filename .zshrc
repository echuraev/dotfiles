if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

if [ -f ~/.zplug/log/job.lock ]; then
    echo "Remove lock file!"
    rm -f ~/.zplug/log/job.lock
fi

source ~/.zplug/init.zsh

#zplug "plugins/git", from:oh-my-zsh                        # Git plugin from oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2          # Syntax highlighting for commands
zplug "lib/completion", from:oh-my-zsh                      # Load completion library for those sweet [tab] squares
zplug 'zplug/zplug', hook-build:'zplug --self-manage'       # Manage zplug as other plugins
zplug 'olivierverdier/zsh-git-prompt' #, hook-load:' source ~/.zplug/repos/olivierverdier/zsh-git-prompt/zshrc.sh'  # Super git prompt
source ~/.zplug/repos/olivierverdier/zsh-git-prompt/zshrc.sh
zplug "plugins/colored-man-pages", from:oh-my-zsh           # Add colors to man pages
zplug "plugins/command-not-found", from:oh-my-zsh           # Suggests package name with relevant command
zplug "plugins/extract", from:oh-my-zsh                     # 'x' alias - swiss knife for archive extracting

zplug load

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

# Load theme
[ -f $HOME/.zsh/colors/theme.zsh ] && source $HOME/.zsh/colors/theme.zsh

# Load configuration
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local
[ -f $HOME/.bashrc.global ] && source $HOME/.bashrc.global

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
