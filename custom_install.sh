#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "CUSTOM INSTALL"

mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.git

git clone https://github.com/LazyVim/starter ~/.config/nvim

ln -sf ${DIR}/rob_plugins.lua ~/.config/nvim/lua/plugins/rob_plugins.lua
rm -f ~/.config/nvim/lua/config/options.lua
ln -sf ${DIR}/rob_options.lua ~/.config/nvim/lua/config/options.lua
