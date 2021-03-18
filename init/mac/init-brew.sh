#!/usr/bin/env bash

mkdir -p ~/bin

# =========================== Level 1 =============================

# 个人软件
brew install emacs-plus tmux ranger trash fzf

# 工作软件
brew install maven mysql redis
brew install go python3 nodejs

# =========================== Level 3 =============================
brew install pwgen scc


# =========================== 其他软件 ============================
git clone https://github.com/minoki/InputSourceSelector.git ~/bin/ # 输入法切换工具
