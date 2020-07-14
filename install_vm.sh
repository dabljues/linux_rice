# Script for VM installation

sh install.sh
# [[ -z "$(grep VBoxClient-all ~/.xprofile)" ]] && echo 'VBoxClient-all' >> ~/.xprofile

sudo pacman --noconfirm --needed -S virtualbox-guest-iso linux-headers  > /dev/null 2>&1
mkdir -p ~/Media/vbox
sudo mount -o loop /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso ~/Media/vbox > /dev/null 2>&1
sudo sh ~/Media/vbox/VBoxLinuxAdditions.run <<< 'yes'
sudo gpasswd -a $USER vboxsf
sudo umount ~/Media/vbox
rm -rf ~/Media