
#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
    echo "Mac OS"
fi

# init gitconfig
ln -s ~/git/mine/system-config/git/gitconfig ~/.gitconfig
ln -s ~/git/mine/system-config/git/gitignore ~/.gitignore

# init bash
ln -s ~/git/mine/system-config/shell/sh_common.sh ~/.sh_common.sh
ln -s ~/git/mine/system-config/shell/func_common.sh ~/.func_common.sh

ln -s ~/git/mine/system-config/emacs.d/ ~/.emacs.d/
ln -s ~/git/mine/system-config/vim/vimrc ~/.vimrc
ln -s ~/git/mine/system-config/home/tmux/tmux.conf ~/.tmux.conf
