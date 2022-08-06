[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.aliasrc"

if [ "$EUID" -eq 0 ]; then
    PROMPT=$'%{\e[91m%}%~ # %{\e[m%}'
else
    PROMPT=$'%{\e[94m%}%~ $ %{\e[m%}'

    clear
    pfetch
fi

for i in $HOME/.local/share/zsh/plugins/*/*.plugin.zsh; do
    source "$i"
done
unset i
