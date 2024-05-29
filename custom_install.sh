#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "CUSTOM INSTALL"

mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.git

git clone https://github.com/LazyVim/starter ~/.config/nvim

ln -sf ${DIR}/rob.lua ~/.config/nvim/lua/plugins/rob.lua

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit ~/.local/bin
