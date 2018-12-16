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
echo "yarn 　インストール方法：'brew install yarn' or npm install yarn"
echo "以上が入っていない場合、実行途中でエラーになることがあります"
echo ""

app_name=$1
yarn create react-app ${app_name}
cd ${app_name}
rm -rf .git
echo "↑こちらがスクリプト終了後に実行できるコマンドです"

echo ""
echo "yarn ejectを実行します"
echo "yを入力してください"
yarn eject
echo ""
echo "以下のようなcreate-react-appで使用するコマンドを使用できます"
echo "yarn start"

