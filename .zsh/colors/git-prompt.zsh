# Take example of code from here: https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html

# Allow for functions in the prompt.
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
    [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

    # Git branch/tag, or name-rev if on detached head
    local GIT_BRANCH=${$((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null)#(refs/heads/|tags/)}

    if [ -n "$GIT_BRANCH" ]; then

        local UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
        local MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
        local STAGED="%{$fg[green]%}●%{$reset_color%}"

        STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"

        local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$NUM_BEHIND%{${reset_color}%}"
        fi

        local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$NUM_AHEAD%{${reset_color}%}"
        fi
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"

        # MERGING
        local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_MERGING%{${reset_color}%}"
        fi
        local GIT_STAGED="$(git diff --cached --name-status 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$GIT_STAGED" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
        fi
        #if [ "$GIT_CONFLICTS" -ne "0" ]; then
        #    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
        #fi
        local GIT_CHANGED="$(git diff --name-status 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$GIT_CHANGED" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
        fi
        local GIT_UNTRACKED="$(git ls-files --other --exclude-standard 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$GIT_UNTRACKED" -ne "0"  ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED%{${reset_color}%}"
            #STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{${reset_color}%}"
        fi

        if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi

        STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
        echo "$STATUS"

    fi

}

# Default values for the appearance of the prompt. Configure at will.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

