#!/usr/bin/env bash

if [[ $(uname) = "Darwin" ]]; then
    echo "Mac osx"
    brew install aspell goku
    brew install --cask squirrel
elif [[ $(uname -a) = *"arch"* ]]; then
    echo "Archlinux OS"
    # gui
    sudo pacman -S xorg xorg-init
    sudo pacman -S gvim emacs \
        # 回收站
        trash-cli \
        aspell aspell-en \
        # 命令行配置
        fzf guake zsh sakura \
        # 输入法
        fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool fcitx5-rime \
        # 壁纸、截图
        feh scrot \
        # i3 配置
        i3-gaps i3status i3lock numlockx polybar dmenu \
        rofi \
        zip unzip \
        xclip \
        rust go lua htop

    yay -S google-chrome

    # 配置 Vundle 插件
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # zsh oh-my-zsh
    yay -S fcitx-sogoupinyin
    # TODO
    yay -S autokey
fi

# -------------------------- init zsh config ------------------------
chsh -s /bin/zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# install zsh plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
