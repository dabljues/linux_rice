[ -d dotfiles ] || mkdir dotfiles

BASEDIR=$(pwd)
# Config
cd
cp -r --parents .config/kitty $BASEDIR/dotfiles
cp -r --parents .config/i3 $BASEDIR/dotfiles
cp -r --parents .config/polybar $BASEDIR/dotfiles
cp --parents .config/env $BASEDIR/dotfiles
cp --parents .config/Xresources $BASEDIR/dotfiles
cp --parents -r .config/zsh $BASEDIR/dotfiles
cp --parents -r .config/vim $BASEDIR/dotfiles
cp --parents .config/compton.conf $BASEDIR/dotfiles
cp --parents .config/oh-my-zsh/oh-my-zsh.sh $BASEDIR/dotfiles
# Themes
cp -r --parents .config/themes $BASEDIR/dotfiles
# Home
cp .xinitrc $BASEDIR/dotfiles
cp .zshenv $BASEDIR/dotfiles