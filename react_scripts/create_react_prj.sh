#! /bin/bash

exist_git_files_str=$(ls | grep .git)

if [ "$exist_git_files_str" <> "" ];then
  echo ".git が含まれるディレクトリでこのスクリプトを実行することはできません"
  exit 0
fi

if [ "$1" = "" ];then
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

echo "↑こちらがスクリプト終了後に実行できるコマンドです"

echo ""
echo "yarn ejectを実行します"
echo "yを入力してください"
yarn eject
echo ""
echo "以下のようなcreate-react-appで使用するコマンドを使用できます"
echo "yarn start"

yarn add -D webpack-cli

$($(dirname $0)/yarnAddReduxMod.sh)
