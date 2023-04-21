#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "CUSTOM INSTALL"

rm -rf ~/user_install
mkdir -p ~/user_install

mkdir -p ~/.config

ln -sf ${DIR}/nvim_config ~/.config/nvim

