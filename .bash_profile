BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

stty -ixon # enable C-s forward search (disable pause / resume)

export PS1="\[\e[1;32m\]\w \$ \[\e[0m\]"
export EDITOR="vim"
export CLICOLOR=1 # colorful ls output

IGNOREEOF=10 # warn 10 times before exiting on C-d

function cdls() {
    cd "$@" && ls -a
}

alias vi='vim'

alias g='cdls'
alias -- -='g ..'
alias -- 2-='g ../..'
alias -- 3-='g ../../..'
alias -- 4-='g ../../../..'
alias -- --='2-'
alias -- ---='3-'
alias -- ----='4-'

# [[ ":$PATH:" != *":$HOME/bin:"* ]] && PATH="$PATH:$HOME/bin"

if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

if [ -f ~/.project-env ]; then
    . ~/.project-env # environment for working on current projects
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
