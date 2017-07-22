#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files=(mygitconfig myzshrc dircolors myvimrc_vundle_plugins myvimrc)

for f in ${files[@]}
do
   ln -sf ${DIR}/${f} ~/.${f}
done

