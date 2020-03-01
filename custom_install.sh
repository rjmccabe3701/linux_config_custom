#!/bin/bash
echo "CUSTOM INSTALL"

rm -rf ~/user_install
mkdir -p ~/user_install


case "$(uname -s)" in
   Linux)
      if [ -f /etc/fedora-release ]
      then
         sudo dnf install -y cmake python3-devel \
            neovim python3-neovim
         sudo dnf install -y python3-pip python3-setuptools
      else
         #Assumes debian
         sudo apt-get update
         sudo apt install -y build-essential cmake python3-dev \
            neovim python3-neovim
         sudo apt install -y python3-dev python3-pip python3-setuptools
         sudo apt install -y clang-format
      fi
      ;;
esac

curl https://raw.githubusercontent.com/llvm-mirror/clang/master/tools/clang-format/clang-format.py > ~/.vim/clang-format.py

cd ~/.vim/plugged/youcompleteme
python3 ./install.py --clang-completer

