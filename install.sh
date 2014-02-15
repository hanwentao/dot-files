#!/bin/bash

if [ "$0" != "./install.sh" ]; then
  echo "This script must be run under the current working directory." >&2
  exit 1
fi

CONF_FILE_LIST="\
  .bash_profile \
  .bashrc \
  .gitconfig \
  .slate \
  .tmux.conf \
  .vimrc \
  .vim \
  "

backup_path="$PWD/backup"
mkdir -p "$backup_path"

for conf_file in $CONF_FILE_LIST; do
  conf_file2="${conf_file/#./_}"
  conf_path="$HOME/$conf_file"
  backup_conf_path="$backup_path/$conf_file"
  new_conf_path="$PWD/$conf_file2"
  if [ -e "$conf_path" ]; then
    echo "Backing up $conf_path to $backup_conf_path"
    mv -f "$conf_path" "$backup_conf_path"
  fi
  echo "Creating symlink for $new_conf_path to $conf_path"
  ln -sf "$new_conf_path" "$conf_path"
done
