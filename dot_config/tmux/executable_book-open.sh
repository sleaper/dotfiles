#!/usr/bin/env bash
selected=$(find ~/Documents/books -type f | fzf --prompt='Books> ')
if [[ -n "$selected" ]]; then
    sioyek "$selected"
fi
exit 0