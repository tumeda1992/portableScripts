#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
#cd $(dirname $0)
##（オプション）オプション引数を使う場合は以下を使用
#haveOpt=0
#while getopts f:dc: OPT
#do
#  case $OPT in
#    f) filename="$OPTARG"
#      haveOpt=1
#      ;;
#    d) isDebug=1
#      haveOpt=1
#      ;;
#    c) count='$OPTARG'
#      haveOpt=1
#      ;;
#  esac
#done
#
#if [ ${haveOpt} = 1 ]
## オプションがある場合、オプション分だけ引数をずらす（これがないと-fなどが$1に入る）
#then
#  shift $(($OPTIND - 1))
#fi


if ["$1" = ""];then
  echo "引数にアプリ名を入力して再実行してください"
  exit 0
fi

echo "このスクリプトは以下を必要とします"
echo "yarn"
echo ""
echo "以上が入っていない場合、実行途中でエラーになることがあります"

app_name=$1
yarn create react-app ${app_name}
cd ${app_name}

echo ""
echo "yを入力してください"
yarn eject
rm -rf .git
