# --------------------------------------------------------------------
#                       function 定义
# --------------------------------------------------------------------

# 检测网络链接畅通
function network()
{
    #目标网站
    if [ -n "$1" ]; then
        local target=$1
    else
        local target=www.baidu.com
    fi
    echo $target

    #超时时间
    local timeout=1

    curl -I -s --connect-timeout ${timeout} ${target} >/dev/null 2>&1

    #获取响应状态码
#    local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`
#if [ "x$ret_code" = "x200" ]; then
    if [ $? -eq 0 ]; then
        #网络畅通
        return 0
    else
        echo "[ERROR]" `date '+%Y-%m-%d %H:%M:%S'` "网络不畅通，请检查网络设置！"
        #网络不畅通
        return 1
    fi
    return 1
}

# git sync origin/master to master
function git_sync()
{
    startTime=`date +%s`
    # todo 使用 || exit
    tmpName="AUTO $(date '+%Y-%m-%d %H:%M:%S')"
    echo $tmpName
    git add . && \
    git stash save $tmpName && \
    git co master && \
    git pull --rebase origin master && \
    mvn -U clean source:jar install -Dcheckstyle.skip=true -Dmaven.test.skip=true -Dcicheck.skip=true && \
    git co - && \
    ## tmpName 不能为空，不然会出错
    git stash apply stash^{/"$tmpName"} && \
    git stash drop $(git stash list | grep "$tmpName" | cut -d: -f1) && \
    git rebase master
    endTime=`date +%s`
    echo "本次运行时间："$((endTime-startTime))"s"
}

# generate passwd
function genpasswd()
{
    len=32
    [[ $1 != ''  ]] && len=$1
    if [[ $(uname) = 'Darwin' ]]
    then
        echo -n $(pwgen -Bs $len 1) |pbcopy; echo "Has been copied to clipboard"
    else
        strings /dev/urandom |tr -dc A-Za-z0-9 | head -c$1; echo
    fi
}
