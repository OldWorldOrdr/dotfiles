[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

clear
pfetch

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bubblewritten"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source $HOME/.aliasrc
