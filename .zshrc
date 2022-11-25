# shellcheck disable=SC2034,SC1091
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

[ "$XDG_CONFIG_HOME" ] && CONF="$XDG_CONFIG_HOME" || CONF="$HOME/.config"
[ "$XDG_CACHE_HOME" ] && CACHE="$XDG_CACHE_HOME" || CACHE="$HOME/.cache"
[ "$XDG_DATA_HOME" ] && DATA="$XDG_DATA_HOME" || DATA="$HOME/.local/share"
[ "$XDG_BIN_HOME" ] && BIN="$XDG_BIN_HOME" || BIN="$HOME/.local/bin"
ZSH="$DATA/zsh"

[ -d "$CONF" ] || mkdir -p "$CONF"
[ -d "$CACHE" ] || mkdir -p "$CACHE"
[ -d "$ZSH" ] || mkdir -p "$ZSH"
[ -d "$BIN" ] || mkdir -p "$BIN" && export PATH="$BIN:$PATH"
[ -f "$CONF/env" ] && . "$CONF/env"
[ -f "$CONF/aliases" ] && . "$CONF/aliases"

HISTFILE="$CACHE/history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

compinit -d "$CACHE/zcompdump"

if [ "$EUID" -eq 0 ]; then
  PROMPT=$'%{\e[01;31m%}%n@%M%{\e[01;34m%} %~ $%{\e[0m%} '
else
  PROMPT=$'%{\e[01;32m%}%n@%M%{\e[01;34m%} %~ $%{\e[0m%} '

  clear
  pfetch

  for plug in "$ZSH"/plugins/*/*.plugin.zsh; do
    . "$plug"
  done
  unset plug
fi
