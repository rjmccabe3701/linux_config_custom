#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files=(mygitconfig myzshrc dircolors)

for f in ${files[@]}
do
   rm -f ~/.${f}
done

