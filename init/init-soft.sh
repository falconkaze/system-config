#!/usr/bin/env bash

if [[ $(uname) = "Darwin" ]]; then
    brew install aspell
    echo "Mac osx"
elif [[ $(uname) = *"arch"* ]]; then
    echo "Archlinux OS"
    sudo pacman -S aspell aspell-en
    sudo pacman -S fzf guake zsh sakura
    sudo pacman -S google-chrome
    sudo pacman -S fcitx fcitx-qt5
    # TODO
    sudo pacman -S i3 numlockx
    yay -S fcitx-sogoupinyin
    # TODO
    yay -S autokey
fi

# -------------------------- init zsh config ------------------------
chsh -s /bin/zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
