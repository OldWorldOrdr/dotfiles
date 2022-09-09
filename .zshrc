[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

autoload -U compinit && compinit

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

[ -f "$CONF/env" ] && source "$CONF/env"
[ -f "$CONF/aliases" ] && source "$CONF/aliases"

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

for plug in $ZSH/plugins/*/*.plugin.zsh; do
    source "$plug"
done
unset plug
