name="dabljues"

necessary_binaries=( yay python-pywal i3-gaps git zsh pulseaudio )
pacman_binaries_file="lists/progs.txt"
aur_binaries_file="lists/aur_progs.txt"

# Copying env file
cp -f dotfiles/.config/env ~/.config/env
mv ~/.dir_colors ~/.config/dircolors
source ~/.config/env

mkdir -p $XDG_DATA_HOME

mkdir -p $XDG_CONFIG_HOME/git
mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}

mkdir -p $XDG_CONFIG_HOME/zsh

# System update

echo "Updating the system!"

sudo pacman-mirrors -g >/dev/null 2>&1
sudo pacman -Syyu --noconfirm >/dev/null 2>&1

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
    sudo yay --noconfirm -S $binary >/dev/null 2>&1
done < $aur_binaries_file

# pywal
wal -i images/ocean.jpg

# oh-my-zsh
rm ~/.zshrc
mkdir -p $XDG_CONFIG_HOME/zsh
curl -Lo install_zsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# replace paths in oh-my-zsh installer
sed -i 's/ZSH=${ZSH:-~\/.oh-my-zsh}/ZSH=${ZSH:-~\/.config\/oh-my-zsh}/g' install_zsh.sh
sed -i 's/~\/.zshrc/~\/.config\/zsh\/.zshrc/g' install_zsh.sh
sh install_zsh.sh --unattended
# rm install_zsh.sh


# Copying dotfiles

echo "Copying dotfiles"

rm -rf ~/.dmenu*
rm ~/.profile
rm ~/.bash*
rm -rf ~/.moc
rm ~/.zshrc
rm ~/.Xresources
rm ~/.xsession*
rm -rf ~/.i3
yes | cp -rfT dotfiles /home/$USER >/dev/null 2>&1

# Most important command! Get rid of the beep!
sudo rmmod pcspkr
sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Make zsh the default shell for the user.
sudo chsh -s $( which zsh ) $USER >/dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"

# Home clean-up
mv ~/.gnupg $XDG_DATA_HOME

mkdir -p ~/.config/gtk-2.0
mv ~/.gtkrc-2.0 $GTK2_RC_FILES

mkdir -p ~/.config/vim
mv ~/.vim* ~/.config/vim

mv ~/.Xauthority ~/.config/Xauthority
#mv ~/.mozilla ~/.config/mozilla

mv ~/.thumbnails ~/.config/thumbnails
mv ~/.urxvt ~/.config/urxvt

mv ~/.gitconfig ~/.config/git/config

mv ~/.Xclients ~/.config/Xclients

# Restart pulseaudio
killall pulseaudio
sudo -u "$name" pulseaudio --start