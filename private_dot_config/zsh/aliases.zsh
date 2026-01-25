# Aliases and functions

###########################################
# GIT HELPERS & ALIASES
###########################################

# Get current branch name
git_current_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Get main branch (main, master, trunk, etc.)
git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}; do
    if command git show-ref -q --verify "$ref"; then
      echo "${ref:t}"
      return 0
    fi
  done
  echo master
}

# Get develop branch
git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  for branch in dev devel develop development; do
    if command git show-ref -q --verify "refs/heads/$branch"; then
      echo "$branch"
      return 0
    fi
  done
  echo develop
}

# Status
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'

# Checkout / Switch
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout $(git_develop_branch)'

# Push / Pull
alias gp='git push'
alias gl='git pull'
alias gpf='git push --force-with-lease --force-if-includes'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

# Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdca='git diff --cached'

# Commit
alias gaa='git add --all'
alias gcam='git commit --all --message'
alias gcn!='git commit --verbose --no-edit --amend'

###########################################
# EDITORS
###########################################

alias mi='micro'

# open vscode in current dir or target
function e {
  if (( $# )); then
    code "$@"
  else
    code .
  fi
}

# Safe rm (recycle bin) - only if gomi is installed
if command -v gomi &>/dev/null; then
  alias rm='gomi'
  alias real_rm="command rm"
fi

# eza (modern ls) - only if eza is installed
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias ll='eza -lhF --icons --group-directories-first --git'
  alias la='eza -lahF --icons --group-directories-first --git'
  alias lt='eza --tree --icons --group-directories-first --git'
fi

# File transfer
alias rsync-cp='rsync --compress --human-readable --links --partial --progress --recursive --times'
alias rsync-mv='rsync-cp --remove-source-files'

# Dates
alias isodate_local="date +%Y-%m-%dT%H:%M:%S%z"
alias isodate_utc="date -u +%Y-%m-%dT%H:%M:%SZ"
alias isodate_basic="date -u +%Y%m%dT%H%M%SZ"
alias unixstamp="date +%s"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias -- -='cd -'  # Go back to previous directory
alias 1='cd -1'    # Go to 1st previous directory in dirstack
alias 2='cd -2'    # Go to 2nd previous directory in dirstack
alias 3='cd -3'    # Go to 3rd previous directory in dirstack
alias d='dirs -v'  # List directory stack

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# yazi - cd on exit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

