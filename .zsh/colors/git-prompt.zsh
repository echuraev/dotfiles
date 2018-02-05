# Take example of code from here: https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html
# Some of ideas take from here: https://github.com/yonchu/zsh-vcs-prompt

# Allow for functions in the prompt.
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt
## VCS_INFO configurations.
#  http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#SEC273
#  https://github.com/olivierverdier/zsh-git-prompt
#  http://d.hatena.ne.jp/mollifier/20100906/p1
#  http://d.hatena.ne.jp/yuroyoro/20110219/1298089409
#  http://d.hatena.ne.jp/pasela/20110216/git_not_pushed
#  http://liosk.blog103.fc2.com/blog-entry-209.html
#  http://qiita.com/items/8d5a627d773758dd8078
if ! type vcs_info > /dev/null 2>&1; then
    autoload -Uz vcs_info || return 1
fi

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
    [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

    # Git branch/tag, or name-rev if on detached head
    local GIT_BRANCH=${$((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null)#(refs/heads/|tags/)}

    if [ -n "$GIT_BRANCH" ]; then
        local ahead="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
        local behind="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
        local staged="$(git diff --cached --name-status 2> /dev/null | wc -l | tr -d ' ')"
        local conflicts="$(git diff --cached --name-status 2> /dev/null | sed '/^[^U]/d' | wc -l | tr -d ' ')"
        local unstaged="$(git diff --name-status 2> /dev/null | sed '/^U/d' | wc -l | tr -d ' ')"
        local untracked="$(git ls-files --other --exclude-standard 2> /dev/null | wc -l | tr -d ' ')"
        local stashed="$(git stash list 2> /dev/null | wc -l | tr -d ' ')"

        # Count staged and conflicts files.
        staged=$(($staged - $conflicts))

        # Take current action (rebasing/merging...)
        local vcs_action=""
        vcs_action=${vcs_info_msg_3_:-$vcs_action}
        STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"
        if [ "$vcs_action" != "" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_MERGING$vcs_action%{${reset_color}%}"
        fi

        if [ "$behind" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$behind%{${reset_color}%}"
        fi

        if [ "$ahead" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$ahead%{${reset_color}%}"
        fi
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"

        if [ "$staged" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$staged%{${reset_color}%}"
        fi
        if [ "$conflicts" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$conflicts%{${reset_color}%}"
        fi
        if [ "$unstaged" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED$unstaged%{${reset_color}%}"
        fi
        if [ "$untracked" -ne "0"  ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$untracked%{${reset_color}%}"
        fi
        if [ "$stashed" -gt 0 ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED$stashed%{${reset_color}%}"
        fi

        local clean=$(($staged + $unstaged + $untracked + $conflicts + $stashed))
        if [ "$clean" -eq "0" ]; then
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
ZSH_THEME_GIT_PROMPT_MERGING=":%{$fg[magenta]%}⚡︎"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{%{$fg[cyan]%}⚑%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

