" use Chinese to show help
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
set nocompatible       " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set fileencoding=utf-8 " 设置文件编码
set termencoding=utf-8 " 设置终端编码
set t_Co=256           " 开启256色支持
set nu                 " nu是number的缩写显示行号
"if has("termguicolors")
"    " enable true color
"    set termguicolors
"endif
set ruler              " 显示标尺，状态栏的行数信息
" set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set guioptions+=m      " 隐藏菜单栏
set laststatus=1       " 隐藏状态栏，2是显示状态栏
set scrolloff=6        " 上下可视行数
" 禁止显示滚动条，适用于gvim
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" GUI时禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 拼写检查
"set spell
" 设置 MacOS 的delete按键模式
set backspace=2

"---------------------------------------Plugin--------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim         " initialize vundle
filetype off                              " required
call vundle#begin()                       " start- all plugins below

Plugin 'VundleVim/Vundle.vim'             " 使用vundle管理插件

Plugin 'scrooloose/nerdtree'              " NERD tree文件浏览器
Plugin 'scrooloose/nerdcommenter'         " 方便写注释
Plugin 'Xuyuanp/nerdtree-git-plugin'      " 修改文件时，改变状态显示

"Plugin 'Valloric/YouCompleteMe'           " 代码提醒
"Plugin 'vim-syntastic/syntastic'          " 代码检查
Plugin 'sillybun/vim-repl'                " 代码执行


Plugin 'SirVer/ultisnips'                 " python自动生成代码
Plugin 'honza/vim-snippets'               " Snippets are separated from the engine. Add this if you want them
"Plugin 'Shougo/deoplete.nvim'

Plugin 'morhetz/gruvbox'                  " 安装gruvbox主题
Plugin 'altercation/vim-colors-solarized' " solarized主题

Plugin 'Lokaltog/vim-powerline'           " 美化状态栏
Plugin 'Yggdroot/indentLine'
Plugin 'autowitch/hive.vim'               " hive 高亮

"Plugin 'Valloric/YouCompleteMe'           " 代码提醒
Plugin 'vim-syntastic/syntastic'          " 代码检查
"Plugin 'yianwillis/vimcdoc'               " 中文帮助手册

Plugin 'Chiel92/vim-autoformat'             " 格式化代码
"Plugin 'terryma/vim-multiple-cursors'     " 多光标编辑
"Plugin 'tell-k/vim-autopep8'
Plugin 'junegunn/vim-easy-align'          " 快速对齐格式化
"Plugin 'terryma/vim-multiple-cursors'     " 多光标编辑
Plugin 'hotoo/pangu.vim'                  " 格式化中文文档
"Plugin 'table-mode'                       " markdown格式化表格
"Plugin 'yianwillis/vimcdoc'               " 中文帮助手册
"Plugin 'jiangmiao/auto-pairs'             " 括号和引号的自动补全
"Plugin 'tell-k/vim-autopep8'
"Plugin 'vim-scripts/javacomplete'
"Plugin 'scrooloose/nerdcommenter'

call vundle#end()                         "stop - all plugins above
"-----------------------------------theme config------------------------------------
set bg=dark                     					"设置背景为黑色
colorscheme gruvbox            						"设置主题为 gruvbox
set guioptions=                 					"去掉两边的scrollbar
set guifont=Monaco:h17          					"设置字体和字的大小
"colorscheme slate
"colorscheme solarized
"let g:solarized_termcolors=256 
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"hi Normal ctermfg=251 ctermbg=none						"ctermfg前景色，ctermbg背景色
"编程主题
func SetTheme()
	set bg=dark                     					"设置背景为黑色
	colorscheme gruvbox            						"设置主题为 gruvbox
	set guioptions=                 					"去掉两边的scrollbar
	set guifont=Monaco:h17          					"设置字体和字的大小
endfunc


" 定义快捷键的前缀，即<Leader> 
let mapleader=","
cnoremap w!! w !sudo tee % > /dev/null
"cnoremap w!! w !sudo tee > /dev/null %

"Fast reloading of the .vimrc
"map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
"map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
"autocmd! bufwritepost .vimrc source ~/.vimrc 

"----------------------------------NERD Tree config------------------------------------
"nmap <Leader>f:NERDTreeToggle<CR>                       "使用NERDTree查看工程文件，设置快捷键
map <F2> :NERDTreeToggle<CR>                            "使用F2打开
let NERDTreeWinSize=32                                  "设置窗口宽度
let NERDTreeShowBookmarks=1                             "显示书签
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']           "设置忽略文件类型

"let NERDTreeWinPos="right"                              "设置窗口位置
"let NERDTreeShowHidden=1                                "显示隐藏文件
let NERDTreeMinimalUI=1                                 "窗口不显示冗余帮助信息
let NERDTreeAutoDeletebBuffer=1                         "删除文件时自动删除文件对应的buffer

"----------------------------------nerdtree git config---------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"---------------------------indentLine------------------------------
"缩进指示线"
let g:indentLine_char='|'
let g:indentLine_enabled=1


"---------------------------pangu------------------------------
"autocmd BufWritePre *.markdown,*.md,*.wiki,*.cnx call PanGuSpacing()

"--------------------------------vim-autopep8-----------------------------
let g:autopep8_disable_show_diff=1

"---------------------------------SirVer/ultisnips-----------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"--------------------------------table-mode---------------------------------
"let g:table_mode_corner = '|'
"let g:table_mode_border=0
"let g:table_mode_fillchar=' '

"function! s:isAtStartOfLine(mapping)
 " let text_before_cursor = getline('.')[0 : col('.')-1]
 " let mapping_pattern = '\V' . escape(a:mapping, '\')
 " let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
 " return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
"endfunction

"inoreabbrev <expr> <bar><bar>
"          \ <SID>isAtStartOfLine('\|\|') ?
"          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
"inoreabbrev <expr> __
"          \ <SID>isAtStartOfLine('__') ?
"          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"-----------------------------------easy-align---------------------------
"以可视模式启动交互式EasyAlign（例如vipga）
xmap ga <Plug>(EasyAlign)

"为动画/文本对象启动交互式EasyAlign（例如gaip）
nmap ga <Plug>(EasyAlign)

"--------------------------------terryma/vim-multiple-cursors--------------
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_confirm_extra_conf=0                                     
" 补全功能在注释中同样有效                                         
"let g:ycm_complete_in_comments=1                                   
" 开启tags补全引擎                                                 
"let g:ycm_collect_identifiers_from_tags_files=1                    
" 键入第一个字符时就开始列出匹配项                                 
"let g:ycm_min_num_of_chars_for_completion=1                        
" YCM相关快捷键，分别是\gl, \gf, \gg                                                    
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>              
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>               
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
""默认配置文件路径"
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
"let g:ycm_confirm_extra_conf=0
"set completeopt=longest,menu
"python解释器路径"
"let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
"是否开启语义补全"
"let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
"let g:ycm_complete_in_comments=1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
"let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
"let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
"let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
"let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'
"上下左右键行为"
"inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
"inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

"set linespace=0             "设置行间距，像素数

set history=100             "history文件中需要记录的行数
set confirm                 "在处理未保存或只读文件的时候，弹出确认
set autoread				"文件在外部被改动后自动载入
set nobackup				"默认不备份
"set noswapfile             "不要生成swap文件，当buffer被丢弃的时候隐藏它
"set bufhidden              "
set clipboard=unnamed       "

set wildmenu				"vim命令自动补全
set gcr=i:ver50-ncvCursor,n-v:block-vCursor		"禁止关闭光标闪烁(guicursor)
set gcr=a:block-blinkon0		"禁止关闭光标闪烁
set cursorline				"高亮显示当前行
"set cursorcolumn			"高亮显示当前列
set incsearch				"开启实时搜索功能
set ignorecase				"搜索忽略大小写
set smartcase               "设置了ignorecase后才有用。如果检索字符中包含大写，就区分大小写
set hlsearch				"高亮显示搜索结果
"set textwidth=100           "当每行超过100个字符时自动换行
set wrap                    "自动折行，并不是加换行符,nowrap
set foldenable				"允许折叠      
set foldmethod=manual			"手动折叠    
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
set showmatch				"高亮显示匹配的括号

"set viminfo+=!             "保存全局变量
"set iskeyword+=_,$,@,%,#,- "带有如下符号的单词不要被换行符分割

" 插入模式下上下左右移动光标  

syntax enable									"开启高亮
syntax on									"允许制定语法高亮替代默认高亮，自动语法高亮
filetype plugin indent on							"检测文件类型，相关插件及设置
packadd! matchit
set autoindent                          "继承前一行的缩进，特别适合用于多行注释,简写为ai
set smartindent                         "为C语言提供自动缩进，简写为si
set cindent                             "使用C样式的缩进
set smarttab                            "在行和段开始处使用制表符
"set mouse=a                             "激活鼠标
"set backspace=eol,start,indent         "设置退格

"----------------------------------set title when new file-----------------------------
autocmd BufNewFile *.py,*.java,*.sh exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'python'
        "call setline(1,"#!/usr/bin/env python3")
        call setline(1,"#!/usr/local/bin/ipython")
        call append(1,"# -*- coding: utf-8 -*-")
        call append(2,"")
    elseif &filetype == 'sh'
        call setline(1,"#!/usr/bin/env bash")
        call append(1,"cd $(dirname $0)")
        call append(2,"")
	endif
endfunc
"----------------------------------when open file-------------------------------------
set ts=4				"ts是tabstop的缩写，设置tab键宽四个空格
set shiftwidth=4                                "设定<<和>>命令缩进的宽度
au BufNewFile,BufRead *.py,*.java,*.md exec ":call OpenFile()"
set expandtab				"把制表符扩展为空格
au BufNewFile,BufRead *.py,*.java,*.sql exec ":call OpenFile()"
func OpenFile()
  if &filetype == 'python'
	set shiftwidth=4			"设置格式化时制表符占用空格数				
"	set softtabstop				"让vim把连续的空格视为一个制表符
    set ts=4				"ts是tabstop的缩写，设置tab键宽四个空格
	call SetTheme()
  elseif &filetype == 'markdown'
    colorscheme koehler
  else
    set shiftwidth=4                                "设定<<和>>命令缩进的宽度
	set ts=2
  endif
endfunc

" 快捷键打开google浏览器
"autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "google-chrome-stable" "%:p"<CR>
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :! google-chrome-stable %<CR>
au BufNewFile,BufRead *.hql set filetype=hive
"-----------------------------------Quick Run!--------------------------------------
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o target/%<.out"
        exec "!time target/%<.out"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac -d target %"
        exec "!time java -cp target %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    "elseif &filetype == 'md'
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

" 打开文件时跳到关闭前所在的位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" o<esc>i"<esc>v`><esc>la"<esc>
vnoremap <leader>' o<esc>i'<esc>v`><esc>la'<esc>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

let g:autoformat_verbosemode=1 "开启详细模式便于查错
nnoremap <F3> :Autoformat<cr>

"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
"autocmd FileType vim,tex let b:autoformat_autoindent=0
"gg=G :retab :RemoveTrailingSpaces
"
"let g:formatdef_sqlformat = '"sqlformat --keywords upper -"'
"let g:formatters_sql = ['sqlformat']

function! Zoom ()
    " 如果当前标签页窗口多于一个，最大化当前窗口；否则，如果设置了最大化参数，关闭当前窗口
    if tabpagewinnr(tabpagenr(), '$') > 1
        tab split
        let b:is_maximized = 1
    elseif exists("b:is_maximized")
        unlet b:is_maximized
        quit
    endif
endfunction

nmap <leader>z :call Zoom()<CR>
"------------------------------- auto input method -----------------------------
if has('mac')
    function! InputMethodWhenExit()
        let b:input_method = system("~/git/mine/system-config/sh/currentInputMethod")
        if (b:input_method == "zh")
            echom system("~/git/mine/system-config/sh/mac/switchInputMethod en")
        endif
    endfunction

    function! InputMethodWhenEnter()
        if (exists("b:input_method") && len(b:input_method) > 0 && b:input_method == "zh")
            echom system("~/git/mine/system-config/sh/mac/switchInputMethod zh")
        endif
    endfunction
elseif has('unix')
    "##### auto fcitx start ######
    let g:input_toggle = 1
    "切换到英语
    function! InputMethodWhenExit()
      let s:input_status = system("fcitx5-remote")
      if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx5-remote -c")
      endif
    endfunction
    "切换到中文
    function! InputMethodWhenEnter()
      let s:input_status = system("fcitx5-remote")
      if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx5-remote -o")
        let g:input_toggle = 0
      endif
    endfunction

    set ttimeoutlen=150
    "##### auto fcitx end ######
endif
"退出插入模式
autocmd InsertLeave * call InputMethodWhenExit()
"进入插入模式
"autocmd InsertEnter *.md call InputMethodWhenEnter()
autocmd InsertEnter * call InputMethodWhenEnter()
