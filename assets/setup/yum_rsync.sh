#!/bin/bash

if [ $# -lt 1 ]; then
    echo "insufficient arguments, Usage:  yum_rsync.sh /data/www" 1>&2;
    exit 0;
fi

if [ ! -d $1 ]; then
    echo "$1 is not a directory" 1>&2;
    exit 0;
fi

ROOT=$1;

# 要同步的远程仓库
STD=rsync://mirrors.ustc.edu.cn/centos/
EPEL=rsync://mirrors.ustc.edu.cn/epel/
FORGE=rsync://mirrors.ispros.com.bd/repoforge/

# ROOT变量
# ROOT=/data/www

/usr/bin/rsync -avrt $STD   --exclude-from=/setup/exclude/centos.list    $ROOT/centos/
/usr/bin/rsync -avrt $EPEL  --exclude-from=/setup/exclude/epel.list      $ROOT/epel/ 
/usr/bin/rsync -avrt $FORGE --exclude-from=/setup/exclude/repoforge.list $ROOT/repoforge/

