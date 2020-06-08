[ -d dotfiles ] || mkdir -p dotfiles/.config && mkdir -p dotfiles/themes


# Config
cp -r ~/.config/kitty dotfiles/.config
cp -r ~/.config/i3 dotfiles/.config
cp -r ~/.config/polybar dotfiles/.config
# Themes
cp -r ~/.config/themes/* dotfiles/themes
# Home
cp ~/.Xresources dotfiles
cp ~/.xinitrc dotfiles