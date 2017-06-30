#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf ${DIR}/mygitconfig ~/.mygitconfig
ln -sf ${DIR}/myzshrc ~/.myzshrc

