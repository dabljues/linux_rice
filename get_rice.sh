[ -d dotfiles ] || mkdir -p dotfiles/.config && mkdir -p dotfiles/themes


# Config
cp -r ~/.config/kitty dotfiles/.config
cp -r ~/.config/i3 dotfiles/.config
cp -r ~/.config/polybar dotfiles/.config
cp ~/.config/env dotfiles/.config
cp ~/.config/Xresources dotfiles/.config
# Themes
cp -r ~/.config/themes/* dotfiles/themes
# Home
cp ~/.xinitrc dotfiles
cp ~/.zshenv dotfiles