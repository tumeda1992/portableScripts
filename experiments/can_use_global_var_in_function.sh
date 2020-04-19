#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

main () {
  echo "関数外で定義した変数が使えるか試す"
  echo "script_exec_path: ${script_exec_path}"
  # 使える！
}



main $1