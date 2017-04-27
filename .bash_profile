BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

stty -ixon # enable C-s forward search (disable pause / resume)

shopt -s histappend

IGNOREEOF=10 # warn 10 times before exiting on C-d

export PS1="\[\e[1;32m\]\w \$ \[\e[0m\]"
export EDITOR="vim"
export CLICOLOR=1 # colorful ls output

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

function cdls() {
    cd "$@" && ls -a
}

function fo() {
    local branches branch

    branches=$(git branch --sort=-committerdate) &&
        branch=$(echo "$branches" | fzf --height 40% --reverse +m) &&
        git checkout $(echo "$branch" | sed "s/.* //")
}

alias vi='vim'

alias so='. ~/.bash_profile'

alias g='cdls'
alias -- -='g ..'
alias -- 2-='g ../..'
alias -- 3-='g ../../..'
alias -- 4-='g ../../../..'
alias -- --='2-'
alias -- ---='3-'
alias -- ----='4-'

[[ ":$PATH:" != *":$HOME/scripts:"* ]] && PATH="$PATH:$HOME/scripts"

if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.project ]; then
    . ~/.project # environment for working on current projects
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
