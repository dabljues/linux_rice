# Script for VM installation

sh install.sh
[[ -n "$(grep VBoxClient-all ~/.xprofile)" ]] && echo '/usr/bin/VBoxClient-all' >> ~/.xprofile

sudo pacman --noconfirm --needed -S virtualbox-guest-iso virtualbox-guest-dkms virtualbox-guest-utils linux-headers > /dev/null 2>&1
sudo systemctl enable vboxservice.service > /dev/null 2>&1
/usr/bin/VBoxClient-all > /dev/null 2>&1