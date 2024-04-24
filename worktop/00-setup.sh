#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install emacs git screenfetch

loadkeys dvp

# this is a comment. Cool. We change the Keyboard layout to dvp

# sudo echo '# KEYBOARD CONFIGURATION FILE
#
# # Consult the keyboard(5) manual page.
#
# XKBMODEL="pc105"
# XKBLAYOUT="us"
# XKBVARIANT="dvp"
# XKBOPTIONS=""
#
# BACKSPACE="guess"
# ' > /etc/default/keyboard

# make a spot for my projects
mkdir src


# make a spot for web projects
mkdir www



## Install all of the dotfiles
mkdir ~/.config
mkdir ~/.config/systemd
mkdir ~/.config/systemd/user/

cd src
git clone https://github.com/gmclachlan45/dotfiles
cp dotfiles/worktop/emacs/.emacs ~
cp dotfiles/worktop/bash/.bash_aliases ~


cp dotfiles/worktop/systemd/user/emacs.service ~/.config//systemd/user/


# Set up everything emacs
# sudo apt-get install

# cp dotfiles/devtop/syncthing/.emacs ~

## Install syncthing to keep Org everywhere I go.
## Have to install manually.
sudo apt-get install syncthing
syncthing cli show system

syncthing cli config devices
syncthing cli config folders

## Enable the systemd daemons
sudo systemctl enable syncthing@emp.service
systemctl --user enable emacs
