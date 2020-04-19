#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

. ${this_script_dir}/log_functions.sh

main () {
  app_name=$1

  validate $app_name
  warn

  create_default_react_app $app_name
  convert_app_into_dev_app

  install_libraries
}

validate () {
  app_name=$1
  if [ "$app_name" = "" ];then
    raise_error "引数にアプリ名を入力して再実行してください"
  fi

  # あっても邪魔しないことを確認したのでコメントアウト
  # exist_git_files_str=$(ls -a | grep .git)
  # if [ "$exist_git_files_str" <> "" ];then
  #   echo ".git が含まれるディレクトリでこのスクリプトを実行することはできません"
  #   exit 0
  # fi
}

warn () {
  echo "このスクリプトは以下を必要とします"
  echo "- yarn (インストール方法：'brew install yarn' or 'npm install yarn')"
  echo "以上が入っていない場合、実行途中でエラーになることがあります"
  echo ""
}

create_default_react_app () {
  app_name=$1
  yarn create react-app ${app_name}
  cd ${app_name}
  if [ $? != 0 ]; then exit_with_error; fi
  log_this_script_message "↑こちらがスクリプト終了後に実行できるコマンドです"
}

convert_app_into_dev_app () {
  log_this_script_message "yarn ejectを実行します(入力を求められるので、yを入力してください)"
  yarn eject
  if [ $? != 0 ]; then exit_with_error; fi
}

install_libraries () {
  log_this_script_message "必要なライブラリをインストールします"
  yarn add -D webpack-cli
  if [ $? != 0 ]; then exit_with_error; fi

  $this_script_dir/yarn_add_redux_mod.sh
}

main "$1"
