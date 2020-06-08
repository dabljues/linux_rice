necessary_binaries=( yay python-pywal i3-gaps git zsh )
pacman_binaries_file="lists/progs.txt"
aur_binaries_file="lists/aur_progs.txt"

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

# Copying dotfiles

echo "Copying dotfiles"

yes | cp -rfT dotfiles /home/$USER >/dev/null 2>&1

# Most important command! Get rid of the beep!
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Make zsh the default shell for the user.
chsh -s /bin/zsh $USER >/dev/null 2>&1
sudo -u "$USER" mkdir -p "/home/$USER/.cache/zsh/"