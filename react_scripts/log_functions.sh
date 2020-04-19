#! /bin/bash

log_this_script_message () {
  message="$1"
  echo "" # 本当は次の行のechoで改行したかったけど、sourceコマンドで読み込むとエスケープされてしまうため
  echo "----------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------"
}

raise_error () {
  error_msg="$1"
  echo "[error] $error_msg"
  exit 1
}

exit_with_error () {
  echo "[error] スクリプト実行中にエラーが発生しました。"
  exit 1
}