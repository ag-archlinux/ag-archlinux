#!/bin/bash
#####  FUNCTIONS SCRIPT                        #####
set -e
#####  QUESTION YES/NO FUNCTION                #####        
question_yesno(){
NEXT=0; until [ $NEXT -eq 1 ]; do
  read -p "$1" ANSWER
  case "$ANSWER" in 
    [yY][eE][sS]|[yY]) 
      $2
      NEXT=1
      ;;
    [nN][oO]|[nN]) 
      $3
      NEXT=1
      ;;
  esac
done;}
#####  ACCOUNT ETC/SUDOERS PERMISSION          #####
accountperms(){
  sed -i "/#MY_PERMISSION/d" /etc/sudoers
  echo -e "$@ #MY_PERMISSION" >> /etc/sudoers ;}
aur(){
  cp -vf /etc/pacman.conf /etc/pacman_backup.conf
  echo -e "$1" >> /etc/pacman.conf 
  echo -e "$2" >> /etc/pacman.conf 
  echo -e "$3" >> /etc/pacman.conf
  sudo pacman --noconfirm --needed -Sy yaourt
  cp -vf /etc/pacman_backup.conf /etc/pacman.conf
  rm /etc/pacman_backup.conf;}