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

ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}
# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

#  COLORS & CUSTOMIZATION {{{ #
PROMPT_COMMON_COLOR=$FG[117]
PROMPT_PROMPT=$FG[077]
#  Git {{{ #
GIT_PROMPT_INFO=$FG[012]
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$GIT_PROMPT_INFO%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" %{$GIT_PROMPT_INFO%}| "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$FG[075]%}%{$GIT_PROMPT_INFO%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[076]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$FG[160]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$FG[166]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[088]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[077]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
#  }}} Git #
#  VIM mode {{{ #
vim_ins_mode="%{$fg[yellow]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[cyan]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-line-init zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
    zle reset-prompt
}
zle -N zle-line-finish
#  }}} VIM mode #
#  }}} COLORS & CUSTOMIZATION #

PROMPT='%(?..%F{red}%U${(l:COLUMNS-1:: :)?} %u)' # Error status
PROMPT+='%{$PROMPT_COMMON_COLOR%}%n@%m%{$reset_color%}:%{$PROMPT_COMMON_COLOR%}%c%{$reset_color%}' # name@hostname:path
PROMPT+='$(git_super_status) %{$PROMPT_PROMPT%}ᐅ%{$reset_color%} ' # git status
RPROMPT='${vim_mode} %D{%d %b %Y} %T' # See man page strftime(3) for more details.
