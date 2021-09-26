#!/bin/sh
[ -d dotfiles ] || mkdir dotfiles

BASEDIR=$(pwd)
# Config
cd
cp -r --parents .config/kitty $BASEDIR/dotfiles
cp -r --parents .config/i3 $BASEDIR/dotfiles
cp -r --parents .config/polybar $BASEDIR/dotfiles
cp --parents .config/Xresources $BASEDIR/dotfiles
cp --parents -r .config/nvim/init.vim $BASEDIR/dotfiles
cp --parents .config/compton.conf $BASEDIR/dotfiles
cp --parents .config/oh-my-zsh/oh-my-zsh.sh $BASEDIR/dotfiles
cp --parents -r .config/X11 $BASEDIR/dotfiles
cp --parents -r .config/rofi $BASEDIR/dotfile
# Zsh
[ -d $BASEDIR/dotfiles/.config/zsh ] || mkdir $BASEDIR/dotfiles/.config/zsh
cp --parents -r .config/zsh/.zprofile $BASEDIR/dotfiles
cp --parents -r .config/zsh/.zshrc $BASEDIR/dotfiles
cp --parents -r .config/zsh/.p10k.zsh $BASEDIR/dotfiles
# Themes
cp -r --parents .config/themes $BASEDIR/dotfiles
# Home
cp .xprofile $BASEDIR/dotfiles
cp .zshenv $BASEDIR/dotfiles
