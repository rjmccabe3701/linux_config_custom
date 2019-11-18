#!/bin/bash
echo "CUSTOM INSTALL"

rm -rf ~/user_install
mkdir -p ~/user_install


case "$(uname -s)" in
   Linux)
      #TODO: this only works for debian-based systems
      sudo apt-get update
      sudo apt install build-essential cmake python3-dev \
         neovim python3-neovim
      sudo apt install python3-dev python3-pip python3-setuptools
     ;;
esac

cd ~/.vim/plugged/youcompleteme
python3 ./install.py --clang-completer

