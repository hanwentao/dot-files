#!/bin/bash

if [ "$0" != "./install.sh" ]; then
    echo "This script must be run under the current working directory." >&2
    exit 1
fi

CONF_FILE_LIST=".profile .bashrc .gitconfig .tmux.conf .vimrc .vim"

for conf_file in $CONF_FILE_LIST; do
    conf_file2="${conf_file/#./_}"
    echo "Creating symlink for $PWD/$conf_file2 to $HOME/$conf_file"
    ln -sf $PWD/$conf_file2 $HOME/$conf_file
done
