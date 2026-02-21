# Aliases and functions

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

# File transfer
alias rsync-cp='rsync --compress --human-readable --links --partial --progress --recursive --times'
alias rsync-mv='rsync-cp --remove-source-files'
alias rsync-web='rsync-cp --exclude node_modules --exclude .next --exclude dist --exclude build --exclude .turbo --exclude .cache --exclude .parcel-cache --exclude .nuxt --exclude .output --exclude .vercel --exclude .env.local'

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

