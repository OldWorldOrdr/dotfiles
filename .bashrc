# shellcheck disable=SC1091
[ "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ "$XDG_CACHE_HOME" ] && CACHE="$XDG_CACHE_HOME" || CACHE="$HOME/.cache"

[ -d "$CONF" ] || mkdir -p "$CONF"
[ -d "$CACHE" ] || mkdir -p "$CACHE"
[ -d "$CONF/bin" ] && export PATH="$CONF/bin:$PATH"
[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"

HISTFILE="$CACHE/history"

if [ "$EUID" -eq 0 ]; then
  PS1="\[\e[91m\]\w \\$ \[\e[0m\]"
else
  PS1="\[\e[94m\]\w \\$ \[\e[0m\]"

  clear
  pfetch
fi
