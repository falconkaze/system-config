#!/usr/bin/env bash

if [[ $(uname) = "Darwin" ]]; then
    echo "Mac osx"
elif [[ $(uname) = *"arch"* ]]; then
    echo "Archlinux OS"
    sudo pacman -S fzf
    sudo pacman -S fcitx fcitx-qt5
    sudo yay -S fcitx-sogoupinyin
fi

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
