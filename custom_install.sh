#!/bin/bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ "$#" = 1 ] || { echo 'Run via linux_config/install.sh CUSTOM_DIRECTORY' >&2; exit 2; }
source "$1"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
if [ ! -e "$config_dir" ] && [ ! -L "$config_dir" ]; then
    if [ "${DRY_RUN:-0}" = 1 ]; then
        printf 'Clone LazyVim starter into %s\n' "$config_dir"
    else
        mkdir -p "$(dirname "$config_dir")"
        git clone --depth=1 https://github.com/LazyVim/starter "$config_dir"
    fi
elif [ ! -f "$config_dir/lua/config/lazy.lua" ]; then
    echo "Existing editor config is not a recognizable LazyVim setup: $config_dir" >&2
    exit 1
fi
link_file "$DIR/rob_plugins.lua" "$config_dir/lua/plugins/rob_plugins.lua"
link_file "$DIR/rob_options.lua" "$config_dir/lua/config/options.lua"
link_file "$DIR/rob_lazy.lua" "$config_dir/lua/config/lazy.lua"
