[[ -r ~/.my_func_common ]] && source ~/.my_func_common

# --------------------------------------------------------------------
#                         alias 配置
# --------------------------------------------------------------------

alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias ll='ls -AlhF --color=auto --time-style=long-iso'
alias la='ls -A --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias tailf='tail -f'

#alias genepass='strings /dev/urandom |tr -dc A-Za-z0-9 | head -c32; echo'

alias gcc="gcc -Wall"

# emacs alias
alias emacsd="emacs --daemon=default"
alias ets="emacsclient -t -s default"
alias ecs='emacsclient -n -c -s default -a ""'
alias es='emacsclient -n -s default -a ""'
alias ocpt='bash ~/git/mine/system-config/sh/emacs/capture_tool.sh'
alias ocps='bash ~/git/mine/system-config/sh/emacs/capture_study.sh'

alias ping="ping -c 3"

# my git repository
MY_GIT_PATH='~/git/mine'
alias blog="cd $MY_GIT_PATH/blog"
alias note="cd $MY_GIT_PATH/2018-notebook"
alias config="cd $MY_GIT_PATH/system-config"
alias read-note="cd $MY_GIT_PATH/read-note"
alias alg="cd $MY_GIT_PATH/leecode"
alias cdg="cd ~/git"

# custome command
alias timestamp='nanotime=`date +%s%N`;echo ${nanotime:0:13}'
alias time2date='fun() { date -d @${1} "+%Y-%m-%d %H:%M:%S";};fun'
alias date2time='fun() { date -d "$*" "+%s000"};fun'

#\[\033[01;31m\]\u\[\033[00m\]\[\033[01;32m\]@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$

# 开发配置
alias mcla='mvn -U clean install -Dcheckstyle.skip=true -Dmaven.test.skip=true -Dcicheck.skip=true'

# git 配置
alias ga='git add'
alias gau='git add -u'
alias ga.='git add .'
# 添加所有 model 类
alias gam='git add $(git status --porcelain --untracked-files=all | sed s/^...// | grep -E "model|constant")'
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbrD='git branch -D'
alias gci='git commit'
alias gcim='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gco.='git checkout .'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gplbm='git pull --rebase origin master'
alias gst='git status'
alias glg='git log --stat'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gplbup='git pull --rebase origin $(git_current_branch)'
alias gdf='git diff --ws-error-highlight=all'

# chmod u+x
alias u+x='chmod u+x'

# --------------------------------------------------------------------
#                      不同系统配置
# --------------------------------------------------------------------
if [[ $(uname) == "Darwin" ]]; then
    alias pwd="pwd | pbcopy && pwd"
    alias rm="trash"
else
    alias rm=trash-put
    alias rl=trash-list
    alias ur=trash-restore
    alias pwd="pwd | xclip -selection c && pwd"
fi
