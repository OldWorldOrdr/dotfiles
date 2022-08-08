[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

autoload -U compinit

if [ "$XDG_DATA_HOME" ]; then
    ZSH="$XDG_DATA_HOME/zsh"
else
    ZSH="$HOME/.local/share/zsh"
fi

if [ "$XDG_CONFIG_HOME" ]; then
    CONF="$XDG_CONFIG_HOME"
else
    CONF="$HOME/.config"
fi

for i in $ZSH/plugins/*/*.plugin.zsh; do
    source "$i"
done
unset i

[ -f "$CONF/env" ] && source "$CONF/env"
[ -f "$CONF/aliases" ] && source "$CONF/aliases"

if [ "$EUID" -eq 0 ]; then
    PROMPT=$'%{\e[91m%}%~ # %{\e[m%}'
else
    PROMPT=$'%{\e[94m%}%~ $ %{\e[m%}'

    clear
    pfetch
fi
