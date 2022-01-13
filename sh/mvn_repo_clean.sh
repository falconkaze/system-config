#!/usr/bin/env bash

set -e

cd ~/.m2/repository

for path in ${MVN_REPO_PATH[@]}
do
    for d in $(find $path -type d -regex '.*/[0-9].*' | sed 's/\/[0-9]\+\(.[0-9]\+\).*//g' | uniq)
    do
        set +e
        cd "$d"
        if [ $? -ne 0 ]
        then
            continue
        fi

        ls -d */ | egrep -v '^\d+(\.\d+)+'
        if [ $? -eq 0 ]
        then
            pwd
            continue
        fi

        # 保留最新5个文件
        rm -rf $(ls -t -d */ | sed -n '6,$p')
    done
    echo clean $path success!
done

#for f in $(find ~/.m2/repository -type d)
#do
#    set +e
#    cd $f
#    if [ $? -ne 0 ]
#    then
#        continue
#    fi
#
#    ls $f | grep 'maven-metadata-local.xml' > /dev/null
#    if [ $? -eq 0 ]
#    then
#        set -e
#        # pwd
#        rm -rf $(ls -t | grep -v '.jar' | grep -v '.pom' | sed -n '10,$p')
#    fi
#done
