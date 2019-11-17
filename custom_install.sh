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

curl -sL install-node.now.sh | sh -s -- -y -P ~/user_install

export PATH=~/scripts:~/user_install/bin:~/user_install/usr/bin:${PATH}
export LD_LIBRARY_PATH=~/user_install/lib/:~/user_install/usr/lib:${LD_LIBRARY_PATH}

nvim \
    "+CocInstall coc-python coc-yank" \
    "+qall"

# cd ~/.vim/bundle/youcompleteme
# python3 ./install.py --clang-completer

