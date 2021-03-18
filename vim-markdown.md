# Vim配置
## vim插件管理工具——vundle
### vundle安装与配置
vundle是用来管理vim插件的工具。安装方式如下：  
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
vundle的配置文件是～/.vimrc,内容如下：
```
" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on
```
常用命令：
```
:PluginList		查看已安装的插件
:PluginInstall		安装插件
:PluginUpdate		更新插件
:PluginSearch		搜索插件，例如:PluginSearch xml就能搜到xml相关的插件
:PluginClean		删除插件，把配置文件中对应插件删除，然后执行该命令

" h: vundle		获取帮助
```
### vim配置markdown
#### 实时显示markdown效果
安装node.js
```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```
安装instant-markdown-d
```
sudo npm -g install instant-markdown-d
```
安装vim插件——vim-instant-markdown，在.vimrc中添加：
```
Plugin 'suan/vim-install-markdown'
```
安装完成后，打开.md文件，输入命令MarkdownPreview
#### 高亮显示Markdown语法
添加vim插件，这里顺序不能变。
```
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
```

