BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PS1="\[\e[1;32m\]\W \$ \[\e[0m\]"
export EDITOR="vim"
