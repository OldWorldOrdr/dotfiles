# shellcheck disable=SC2034,SC1091
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

autoload -U compinit && compinit

[ "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ -d "$CONF" ] || mkdir -p "$CONF"

[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"

HISTFILE="$CONF/history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if [ "$EUID" -eq 0 ]; then
    PROMPT=$'%{\e[91m%}%~ # %{\e[0m%}'
else
    PROMPT=$'%{\e[94m%}%~ $ %{\e[0m%}'

    clear
    pfetch
fi

for plug in "$CONF"/zsh/plugins/*/*.plugin.zsh; do
    source "$plug"
done
unset plug
