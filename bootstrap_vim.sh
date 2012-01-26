#!/bin/bash
declare -r PROJECTS="$HOME/Projects"
declare -r LOCAL_NAME="shared"
declare -r SHARED="$PROJECTS/$LOCAL_NAME"
declare -r REPO="git@github.com:lholden/shared.git"

if [[ -e "$HOME/.vimrc" || -e "$HOME/.gvimrc" || -d "$HOME/.vim" ]] ; then
  read -p "Erase the existing VIM configuration? (y/n) "
  if [[ "$REPLY" != "y" ]]; then
    echo "Not disturbing existing configuration, exiting!"
    exit 1
  fi
fi

# Beside existing configs, this will catch existing symlinks
rm -rf $HOME/.vimrc $HOME/.gvimrc $HOME/.vim

mkdir -p $PROJECTS
if [[ -d "$SHARED" ]]; then
  cat $SHARED/.git/config | grep $REPO &> /dev/null
  if [[ "$?" != "0" ]]; then
    echo "ERROR: Directory $SHARED exists, but is not a clone from $REPO"
    exit 1
  fi
  pushd $SHARED > /dev/null
  git pull
  popd > /dev/null
else
  pushd $PROJECTS > /dev/null
  git clone $REPO $LOCAL_NAME
  popd > /dev/null
fi

ln -s $SHARED/dot_vim    $HOME/.vim
ln -s $SHARED/dot_vimrc  $HOME/.vimrc
ln -s $SHARED/dot_gvimrc $HOME/.gvimrc

vim +exit
