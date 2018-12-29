#!/bin/bash
set -e
package_aur(){
    package="$1"

#####  INSTALLATION OF AUR PACKAGES  #####
#----------------------------------------------------------------------------------
    if pacman -Qi $package &> /dev/null; then
		echo "####################  "$package" IS ALREADY INSTALLED  ####################"
    else
	    if pacman -Qi yay &> /dev/null; then
		    echo "####################        Installing with yay        ####################"
		    yay -S --noconfirm $package
	    elif pacman -Qi trizen &> /dev/null; then
		    echo "####################      Installing with trizen       ####################"
		    trizen -S --noconfirm --needed --noedit $package
	    elif pacman -Qi yaourt &> /dev/null; then
		    echo "####################      Installing with yaourt       ####################"
		    yaourt -S --noconfirm $package
	    elif pacman -Qi pacaur &> /dev/null; then
		    echo "####################      Installing with pacaur       ####################"
		    pacaur -S --noconfirm --noedit  $package
	    elif pacman -Qi packer &> /dev/null; then
		    echo "####################      Installing with packer       ####################"
		    packer -S --noconfirm --noedit  $package
	    fi
	    if pacman -Qi $package &> /dev/null; then
		    echo "####################   "$package" HAS BEEN INSTALLED   ####################"
	    else
		    RED='\033[0;31m'
            NC='\033[0m'
		    echo -e "#################### ${RED}"$package"${NC} HAS NOT BEEN INSTALLED ####################"
	    fi
    fi
}
read -p "AUR: " AUR
package_aur $AUR