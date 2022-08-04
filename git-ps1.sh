#!/bin/bash
source git-prompt.sh

GITPROMPT=$(__git_ps1 "%s")
if [ $GITPROMPT ]; then
    printf ' \e[38;5;235m\ue0b6\e[48;5;235m\e[38;5;33m%s\e[m\e[38;5;235m\ue0b4\e[m' "$GITPROMPT"
fi
