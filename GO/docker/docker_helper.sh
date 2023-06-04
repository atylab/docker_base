#!/bin/zsh

# ワンライナー用引数
mode=$1

# .envを読み込み
source .env

target_yml='docker-compose.yml'

# キャッシュなしビルド
function cleanbuild {
    docker-compose -p ${SCHEMA} -f ${target_yml} build --no-cache 
}

# ビルドのみ
function build {
    docker-compose -p ${SCHEMA} -f ${target_yml} build
}

# up (ビルドあり)
function up {
    docker-compose -p ${SCHEMA} -f ${target_yml} up -d --build
}

# ワンライナー起動
function all_up {
    docker-compose -p ${SCHEMA} -f ${target_yml} up -d --build
}

# 起動
function start {
    docker-compose -p ${SCHEMA} -f ${target_yml} start
}

# 停止
function stop {
    docker-compose -p ${SCHEMA} -f ${target_yml} stop
}

# 再起動
function restart {
    docker-compose -p ${SCHEMA} -f ${target_yml} restart
}

# モード選択
if [ -z $mode ] ; then
    echo 実行区分を入力してください
    echo - "\033[0;32m cleanbuild \033[0;39m (--no-cacheオプションが付きます)"
    echo - "\033[0;32m build \033[0;39m"
    echo - "\033[0;32m up \033[0;39m (ビルドオプション付きでupします)"
    echo - "\033[0;32m all_up \033[0;39m (全コンテナをビルドオプション付きでupします)"
    echo - "\033[0;32m start \033[0;39m"
    echo - "\033[0;32m stop \033[0;39m"
    echo - "\033[0;32m restart \033[0;39m"
    read mode 
fi

case "$mode" in
    "cleanbuild" ) cleanbuild ;;
    "build" ) build ;;
    "up" ) up ;;
    "all_up" ) all_up;;
    "start" ) start ;;
    "stop" ) stop ;;
    "restart" ) restart ;;
    * ) echo "オプションが不正です"
esac


