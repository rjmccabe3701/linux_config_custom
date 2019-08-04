#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files=(mygitconfig myzshrc dircolors myvimrc_vundle_plugins \
       myvimrc mytmux.conf)

for f in ${files[@]}
do
   ln -sf ${DIR}/${f} ~/.${f}
done

if [ ! -d ~/.vim/bundle/youcompleteme ]; then
   echo "Run the base linux_config install first" >&2
   exit 1
fi

sudo apt-get update
sudo apt install build-essential cmake python3-dev \
   neovim python3-neovim
cd ~/.vim/bundle/youcompleteme
python3 ./install.py --clang-completer

sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
