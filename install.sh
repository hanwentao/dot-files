#!/bin/bash

os_type=$(uname)
repo_path=$(dirname "$0")
cd "$repo_path"

CONF_FILE_LIST="\
  .gitconfig \
  .slate-macosx \
  .tmux.conf \
  .vimrc \
  .vim \
  .zshrc \
  .zshenv-macosx \
  "

backup_path="$PWD/backup"
#if [ -e "$backup_path" ]; then
  #echo "Backup directory already exists"
  #exit 1
#fi
mkdir -p "$backup_path"

for conf_file in $CONF_FILE_LIST; do
  visible_conf_file="${conf_file/#./_}"
  if [[ "$visible_conf_file" == *-macosx && "$os_type" != Darwin ]]; then
    echo "Skipping $visible_conf_file"
    continue
  fi
  conf_path="$HOME/$conf_file"
  backup_conf_path="$backup_path/$conf_file"
  real_conf_path="$PWD/$visible_conf_file"
  if [ -e "$conf_path" ]; then
    echo "Backing up $conf_path to $backup_conf_path"
    mv "$conf_path" "$backup_conf_path"
  fi
  echo "Creating symlink for $real_conf_path to $conf_path"
  ln -sf "$real_conf_path" "$conf_path"
done
