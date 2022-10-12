if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Change default editor to nvim
set -gx EDITOR nvim

# Terminal operations
alias ll="exa -l --icons -a --git"
alias llt="exa -T --icons"
alias cs="clear"
alias rmf="rm -rf"

# Coding stuff
alias py="python3"
alias pyt="pytest"
alias tsn="ts-node"
alias nv="nvim"
alias prac="cd ~/Projects/Practice && source venv/bin/activate.fish"
alias ve="source venv/bin/activate.fish"
alias dve="deactivate"

# git
alias gpo="git push origin"
alias gs="git status"
alias gca="git commit -am"
alias gc="git commit"
alias gl="git log &| less"
