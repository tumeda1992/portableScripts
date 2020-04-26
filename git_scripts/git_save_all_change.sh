#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
script_exec_path=$(pwd)
this_script_dir=$(dirname $0)
#cd $this_script_path

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

main () {
  haveOpt=0
  commit_message=""
  prefix=""
  use_branch_name_as_prefix=0
  while getopts m:b OPT
  do
    case $OPT in
      m) commit_message="$OPTARG"
        haveOpt=1
        ;;
      b) use_branch_name_as_prefix=1
        haveOpt=1
        ;;
    esac
  done

  if [ ${haveOpt} = 1 ];then
    shift $(($OPTIND - 1))
  fi

  current_branch="$(${this_script_dir}/currentBranch.sh)"
  
  cd ${script_exec_path}
  # TODO オプション指定したら、ファイル1つ1つdiff見ながら追加するか選べる機能作る（ディレクトリ掘るとかは面倒臭そう）
  git add -A
  git status

  if [ ${use_branch_name_as_prefix} = 1 ];then
    prefix="${current_branch} "
  fi

  # NOTE 関数で分けたかったがプロンプトで標準出力が汚れるから仕方なくmain関数内
  if [ "$commit_message" = "" ];then
    while true; do
      read -p "コミットメッセージ: ${prefix}" commit_message_input
      commit_message="${prefix}${commit_message_input}"

      echo "以下のコミットメッセージでよろしいですか？"
      echo "${commit_message}"
      read -p "[yn]:" if_y_or_no
      if [ "$if_y_or_no" = "y" ]; then
        break
      fi
    done
  fi

  commit_command="git commit -m \"${commit_message}\""
  echo ${commit_command}
  bash -c "${commit_command}"

  if [ $? != 0 ]; then exit_with_error; fi
  push_command="git push origin ${current_branch}"
  echo ${push_command}
  bash -c "${push_command}"
}

exit_with_error () {
  echo "[error] コマンド実行中にエラーが発生しました。"
  exit 1
}

main "$1"