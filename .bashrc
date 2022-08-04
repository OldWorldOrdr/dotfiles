[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"

alias cls='clear'
alias ls='ls --group-directories-first --color -A'
alias l='ls --group-directories-first --color -Alh'
alias update='sudo apk upgrade'
alias ..='cd ..'
alias ...='cd ../..'

if [ "$EUID" -eq 0 ]; then
    PS1='\[\e[91m\]\w \\$ \[\e[m\]'
else
    PS1='\e[38;5;236m\e[48;5;236m\e[32m\w\e[m\e[38;5;236m\e[m$(git-ps1.sh) '
    #PS1='\[\e[94m\]\w \\$ \[\e[m\]'

    clear
    pfetch
fi
