# user, host, full path, and time/date on two lines for easier vgrepping

function hg_prompt_info {
  if (( $+commands[hg] )) && [[ -e ~/.hgrc ]] && grep -q "prompt" ~/.hgrc; then
    hg prompt --angle-brackets "\
<hg:%{$fg[green]%}<branch>%{$reset_color%}><:%{$fg[green]%}<bookmark>%{$reset_color%}>\
</%{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
  fi
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function mygit() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(git_prompt_short_sha)$(git_prompt_status)%{$fg_bold[green]%}$ZSH_THEME_GIT_PROMPT_SUFFIX "
  fi
}

function retcode() {}

# alternate prompt with git & hg
PROMPT=$'%{$fg_bold[magenta]%}┌─[%{$fg_bold[green]%}%n%b%{$fg[black]%}@%{$fg[cyan]%}%m%{$fg_bold[magenta]%}]%{$reset_color%} - %{$fg_bold[magenta]%}[%{$fg_bold[default]%}%~%{$fg_bold[magenta]%}]%{$reset_color%} - %{$fg_bold[magenta]%}[%b%{$fg[orange]%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{$fg_bold[magenta]%}]
%{$fg_bold[magenta]%}└─[%{$fg_bold[blue]%}%?$(retcode)%{$fg_bold[magenta]%}]%{$fg_bold[green]%} <$(mygit)$(hg_prompt_info)>%{$reset_color%} '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '
