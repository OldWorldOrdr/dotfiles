[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

if [ "$XDG_CONFIG_HOME" ]; then
    CONF="$XDG_CONFIG_HOME"
else
    CONF="$HOME/.config"
fi

[ -f "$CONF/env" ] && source "$CONF/env"
[ -f "$CONF/aliases" ] && source "$CONF/aliases"

if [ "$EUID" -eq 0 ]; then
    PS1="\[\e[91m\]\w \\$ \[\e[m\]"
else
    PS1="\[\e[94m\]\w \\$ \[\e[m\]"

    clear
    pfetch
fi
