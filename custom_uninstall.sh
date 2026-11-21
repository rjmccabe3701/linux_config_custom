#!/bin/bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ "$#" = 1 ] || { echo 'Run via linux_config/uninstall.sh CUSTOM_DIRECTORY' >&2; exit 2; }
source "$1"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
unlink_file "$DIR/rob_plugins.lua" "$config_dir/lua/plugins/rob_plugins.lua"
unlink_file "$DIR/rob_options.lua" "$config_dir/lua/config/options.lua"
