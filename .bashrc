[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.aliasrc"

if [ "$EUID" -eq 0 ]; then
    PS1="\[\e[91m\]\w \$ \[\e[m\]"
else
    PS1="\[\e[94m\]\w \$ \[\e[m\]"

    clear
    pfetch
fi
