[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

clear
pfetch

PS1="\[\e[94m\]\w \\$ \[\e[m\]"

alias cls='clear'
alias ls='ls --group-directories-first --color -A'
alias l='ls --group-directories-first --color -Al'
alias update='topgrade'
alias ..='cd ..'
alias ...='cd ../..'
