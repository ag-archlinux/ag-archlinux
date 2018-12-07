#!/bin/bash
set -e
#####  UPDATE PACKAGES, GIT         #####
pacman -Syyu
echo '###################git ###################'
pacman --noconfirm --needed -S git
#####  MY FUNCTIONS                 #####
git clone https://github.com/ag-archlinux/ag-archlinux
source /root/ag-archlinux/functions.sh
#####  INPUTS                       #####
read -p "Enter your username: " PERSONAL_ACCOUNT
#####  BASH COMPLETION              #####	
pacman  --noconfirm --needed  -S bash-completion
#####  PERSONAL ACCOUNT             #####
useradd -m -g users -G audio,video,network,wheel,storage -s /bin/bash $PERSONAL_ACCOUNT
#####  PASSWORD OF PERSONAL ACCOUNT #####
passwd $PERSONAL_ACCOUNT
#####  ACCOUNT SUDO PERMITIONS      #####
accountperms "%wheel ALL=(ALL) NOPASSWD: ALL"
#####  AUR PACKAGES                 #####
#aur "[archlinuxfr]" "SigLevel=Never" "Server=http://repo.archlinux.fr/$arch"
#####  UPDATE PACKAGES              #####
sudo pacman --noconfirm --needed -Syu
#####  XORG                         #####
sudo pacman  --noconfirm --needed -S xorg-server xorg-apps xorg-xinit xterm
lspci | grep -e VGA -e 3D
#####  LIGHTDM                      #####
sudo pacman --noconfirm --needed -S lightdm
sudo pacman --noconfirm --needed -S lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo systemctl enable lightdm.service
#####  I3                           #####
sudo pacman --noconfirm --needed -S i3status i3-gaps i3blocks dmenu
#####  PROGRAMS                     #####
sudo pacman --noconfirm --needed -S ncmpcpp 	pulseaudio 	wget zathura firefox conky termite 
#####  START                        #####
startx
echo "####################     INSTALLATION FINISHED     ####################"