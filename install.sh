#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files=(mygitconfig myzshrc dircolors myvimrc_vundle_plugins myvimrc)

for f in ${files[@]}
do
   ln -sf ${DIR}/${f} ~/.${f}
done

if [ ! -d ~/.vim/bundle/youcompleteme ]; then
   echo "Run the base linux_config install first" >&2
   exit 1
fi

sudo apt install build-essential cmake python3-dev
cd ~/.vim/bundle/youcompleteme
./install.py --clang-completer
