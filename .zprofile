export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS

function cdls() {
    cd "$@" && ls -a
}

alias g='cdls'
alias -- -='g ..'
alias -- 2-='g ../..'
alias -- 3-='g ../../..'
alias -- 4-='g ../../../..'
alias -- --='2-'
alias -- ---='3-'
alias -- ----='4-'

alias kc='kubectl'

autoload -U compinit && compinit -i

