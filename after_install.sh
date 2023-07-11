# Best to launch from X server running

# remove vim?

sudo pacman -Rns vim

# pywal
wal -i images/ocean.jpg
# add wal -R to xinitrc

# Set dark theme (for example for Chromium)
dconf write /org/gnome/desktop/interface/color-scheme \'prefer-dark\'
