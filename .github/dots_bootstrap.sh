#!/bin/bash

if ! command -v git >/dev/null || ! pacman -Qi xdg-user-dirs >/dev/null; then
    echo "Installing required packages..."
    sudo pacman -Sy --noconfirm git xdg-user-dirs
fi

echo "Preparing folders..."
sleep 1 && clear

if [ ! -e $HOME/.config/user-dirs.dirs ]; then
    xdg-user-dirs-update
    echo "Creating xdg-user-dirs..."
    sleep 1 && clear
else
    xdg-user-dirs-update
    echo "user-dirs.dirs already exists!"
    sleep 1 && clear
fi

sleep 1 && clear

echo "Downloading dotfiles repository..."
git clone https://github.com/seeingangelz/dotfiles.git $HOME/Documents/dotfiles

cd $HOME/Documents/dotfiles/
