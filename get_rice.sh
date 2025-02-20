#!/bin/sh
[ -d dotfiles ] || mkdir dotfiles

BASEDIR=$(pwd)
# Config
cd
cp -r --parents .config/kitty $BASEDIR/dotfiles
cp -r --parents .config/i3 $BASEDIR/dotfiles
cp -r --parents .config/polybar $BASEDIR/dotfiles
cp --parents .config/Xresources $BASEDIR/dotfiles
[ -e .config/nvim/init.vim ] && cp --parents -r .config/nvim/init.vim $BASEDIR/dotfiles
[ -e .config/compton.conf ] && cp --parents .config/compton.conf $BASEDIR/dotfiles
cp --parents -r .config/X11 $BASEDIR/dotfiles
cp --parents -r .config/rofi $BASEDIR/dotfiles
# Hyprland
[ -d $BASEDIR/dotfiles/.config/hypr ] || mkdir $BASEDIR/dotfiles/.config/hypr
cp --parents -r .config/hypr $BASEDIR/dotfiles
# nushell
[ -d $BASEDIR/dotfiles/.config/nushell ] || mkdir $BASEDIR/dotfiles/.config/nushell
cp --parents -r .config/nushell/config.nu $BASEDIR/dotfiles
[ -d $BASEDIR/dotfiles/.config/starship ] || mkdir $BASEDIR/dotfiles/.config/starship
cp --parents -r .config/starship/starship.toml $BASEDIR/dotfiles
# Themes
cp -r --parents .config/themes $BASEDIR/dotfiles
# Home
cp .xprofile $BASEDIR/dotfiles
