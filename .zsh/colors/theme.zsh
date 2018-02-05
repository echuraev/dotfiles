# Load git prompt
[ -f $HOME/.zsh/colors/git-prompt.zsh ] && source $HOME/.zsh/colors/git-prompt.zsh

typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

#  COLORS & CUSTOMIZATION {{{ #
PROMPT_COMMON_COLOR=$FG[117]
PROMPT_PROMPT=$FG[077]
#  Git {{{ #
GIT_PROMPT_INFO=$FG[012]
ZSH_THEME_GIT_PROMPT_PREFIX="%{$GIT_PROMPT_INFO%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$FG[075]%}%{$GIT_PROMPT_INFO%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[076]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$FG[160]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$FG[166]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[130]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[077]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
#  }}} Git #
#  VIM mode {{{ #
# Updates editor information when the keymap changes.
function zle-keymap-select() {
    zle reset-prompt
    zle -R
}

zle -N zle-keymap-select

KEYMAP=viins
function vi_mode_prompt_info() {
    vim_ins_mode="%{$fg[yellow]%}[INS]%{$reset_color%}"
    vim_cmd_mode="%{$fg[cyan]%}[CMD]%{$reset_color%}"
    echo "${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
}

#  }}} VIM mode #
#  }}} COLORS & CUSTOMIZATION #
#  PROMPT {{{ #
PROMPT='%(?..%F{red}%U${(l:COLUMNS-1:: :)?} %u)' # Error status
PROMPT+='%{$PROMPT_COMMON_COLOR%}%n@%m%{$reset_color%}:%{$PROMPT_COMMON_COLOR%}%c%{$reset_color%} ' # name@hostname:path
PROMPT+='$(git_info) ' # git status
PROMPT+='%{$PROMPT_PROMPT%}ᐅ%{$reset_color%} ' # git status
RPROMPT='$(vi_mode_prompt_info) %D{%d %b %Y} %T' # See man page strftime(3) for more details.
#  }}} PROMPT #
