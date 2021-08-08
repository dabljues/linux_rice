# TODO:
# silence commands (yay, zsh)
# add some user scripts

name="dabljues"

necessary_binaries=( i3-gaps xorg xorg-xinit zsh pulseaudio python-pywal picom feh kitty neovim rofi lsd )
pacman_binaries_file="lists/progs.txt"
aur_binaries_file="lists/aur_progs.txt"

# dir colors (zsh? )
if [[ -d ~/.dir_colors ]] ; then
    mv ~/.dir_colors ~/.config/dircolors
else
    mkdir -p ~/.config/dircolors
fi

# create .local/bin
mkdir -p ~/.local/bin

# source all the necessary variables
source dotfiles/.zprofile

mkdir -p $XDG_DATA_HOME

mkdir -p $XDG_CONFIG_HOME/git

mkdir -p $XDG_CONFIG_HOME/zsh

# System update

echo "Updating the system!"

#sudo pacman-mirrors -g >/dev/null 2>&1
#sudo pacman -Syyu --noconfirm >/dev/null 2>&1
sudo pacman -Sy

# Installing git

sudo pacman --noconfirm --needed -S git >/dev/null 2>&1

# Installing yay

echo "Installing yay"

# [ -z "$(command -v yay)" ] && git clone https://aur.archlinux.org/yay.git > /dev/null 2>&1 && cd yay && sudo -u "$name" makepkg --noconfirm -si >/dev/null 2>&1 && cd .. && rm -rf yay
sudo pacman --noconfirm --needed -S yay >/dev/null 2>&1

# Remove conflicting packages

sudo pacman --noconfirm -Rns i3 > /dev/null 2>&1

# Necessary binaries
echo "Installing necessary binaries"

for binary in "${necessary_binaries[@]}"
do
   echo "Installing ${binary}"
   sudo pacman --noconfirm --needed -S $binary >/dev/null 2>&1
done

# pacman binaries
echo "Installing pacman binaries"
while read binary; do 
    echo "Installing ${binary}"
    sudo pacman --noconfirm --needed -S $binary >/dev/null 2>&1
done < $pacman_binaries_file


# AUR binaries
echo "Installing AUR binaries"
while read binary; do 
    echo "Installing ${binary}"
    yay --noconfirm -S $binary >/dev/null 2>&1
done < $aur_binaries_file

# oh-my-zsh
[ -f ~/.zshrc ] && rm ~/.zshrc
mkdir -p $XDG_CONFIG_HOME/zsh
curl -Lo install_zsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /dev/null 2>&1
# replace paths in oh-my-zsh installer
sed -i 's/ZSH=${ZSH:-~\/.oh-my-zsh}/ZSH=${ZSH:-~\/.config\/oh-my-zsh}/g' install_zsh.sh
sed -i 's/~\/.zshrc/~\/.config\/zsh\/.zshrc/g' install_zsh.sh
sh install_zsh.sh --unattended > /dev/null 2>&1
rm install_zsh.sh
source $ZDOTDIR/.zshrc
# plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions
# theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/themes/powerlevel10k



# Copying dotfiles

echo "Copying dotfiles"

rm -rf ~/.dmenu* > /dev/null 2>&1
[ -f ~/.profile ] && rm ~/.profile
rm ~/.bash* > /dev/null 2>&1
[ -d ~/.moc ] && rm -rf ~/.moc
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.Xresources ] && rm ~/.Xresources
rm ~/.xsession* > /dev/null 2>&1
[ -d ~/.i3 ] && rm -rf ~/.i3
yes | cp -rfT dotfiles /home/$USER >/dev/null 2>&1

# Most important command! Get rid of the beep!
sudo rmmod pcspkr
sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Make zsh the default shell for the user.
sudo chsh -s $( which zsh ) $USER >/dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"

# Home clean-up
[ -f ~/.gnupg ] && mv ~/.gnupg $XDG_DATA_HOME

mkdir -p ~/.config/gtk-2.0
[ -d ~/.gtkrc-2.0 ] && mv ~/.gtkrc-2.0 $GTK2_RC_FILES

[ -f ~/.Xauthority ] && mv ~/.Xauthority ~/.config/Xauthority
#mv ~/.mozilla ~/.config/mozilla

[ -d ~/.thumbnails ] && mv ~/.thumbnails ~/.config/thumbnails
[ -d ~/.urxvt ] && mv ~/.urxvt ~/.config/urxvt

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.config/git/config

[ -d ~/.Xclients ] && mv ~/.Xclients ~/.config/Xclients

# Restart pulseaudio
killall pulseaudio > /dev/null 2>&1
sudo -u "$name" pulseaudio --start

# TODO: Remove all DMs (like lightdmg) if installed

# Generate pywal theme

wal -i images/ocean.jpg > /dev/null 2>&1