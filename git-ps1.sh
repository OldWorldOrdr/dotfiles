#!/bin/bash
source git-prompt.sh

if [ -d $PWD/.git ]; then
    printf ' \e[38;5;236m\ue0b6\e[48;5;236m\e[38;5;33m%s\e[m\e[38;5;236m\ue0b4\e[m' "$(__git_ps1 "%s")"
fi
