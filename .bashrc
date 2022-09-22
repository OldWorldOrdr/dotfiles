# shellcheck disable=SC1091
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

[ "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ -d "$CONF" ] || mkdir -p "$CONF"

[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"

HISTFILE="$CONF/history"

if [ "$EUID" -eq 0 ]; then
    PS1="\[\e[91m\]\w \\$ \[\e[0m\]"
else
    PS1="\[\e[94m\]\w \\$ \[\e[0m\]"

    clear
    pfetch
fi
