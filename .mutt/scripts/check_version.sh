#!/bin/bash

# Helper to check version on mutt and load version dependent settings
#
# Usage in $HOME/.mutt/config/settings.mutt:
#
#     source `$HOME/.mutt/scripts/check_version.sh`

function version () {
    echo "$@" | gawk -F . '{ printf("%03d%03d%03d\n", $1,$2,$3); }';
}

mutt_version="$(mutt -v | head -n 1 | sed 's/Mutt //g' | sed 's/ .*$//g')"

if [ "$(version "$mutt_version")" -ge "$(version "1.11")" ]; then
    echo "$HOME/.mutt/config/settings_1.11_up.mutt"
else
    echo "$HOME/.mutt/config/settings_1.11_down.mutt"
fi
