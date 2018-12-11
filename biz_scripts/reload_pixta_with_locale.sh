#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
#cd $(dirname $0)
##（オプション）オプション引数を使う場合は以下を使用
haveOpt=0
locale=""
quick_run=0
while getopts l:q OPT
do
  case $OPT in
    l) locale="$OPTARG"
      haveOpt=1
      ;;
    q) quick_run=1
      haveOpt=1
      ;;
  esac
done

if [ ${haveOpt} = 1 ]
# オプションがある場合、オプション分だけ引数をずらす（これがないと-fなどが$1に入る）
then
  shift $(($OPTIND - 1))
fi



if [ ${quick_run} = 0 ]
then
  docker exec -it pixta bundle exec rake assets:precompile --trace RAILS_ENV=development
fi

if [ "$locale" = "" ]
then
  echo "言語を選んでください。日本語→日本語の場合は未入力可。"
  echo "（intlを選択するとなぜか日本含む全部のロケールのサイト見れる）"
  echo "日本語:jp / 英語:intl / 繁体字:tw / 簡体字:cn / 韓国語:kr / タイ語:th"
  read -p ": " locale
fi

if [ "$locale" != "" ]
then
  exec_cmd="export DEFAULT_COUNTRY='$locale'; restart_unicorn.sh"
else
  exec_cmd="restart_unicorn.sh"
fi

echo "docker exec -it pixta bash -c \"$exec_cmd\""

docker exec -it pixta bash -c "$exec_cmd"




