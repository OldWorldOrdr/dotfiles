[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

clear

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bubblewritten"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias cls='clear'
alias ls='lsd -A --group-directories-first'
alias update='topgrade'

pfetch
