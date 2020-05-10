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
  selected_image_name="$1"
  if [ "$selected_image_name" = "" ];then
    echo "引数にイメージ名を入力して再実行してください"
    exit 1
  fi
  
  containers_of_images=$(docker ps -a | grep ${selected_image_name} | awk '{print $1}')

  if [ "$containers_of_images" != "" ];then
    print_and_exec "docker stop ${containers_of_images}"
    print_and_exec "docker rm ${containers_of_images}"
  fi
  
  print_and_exec "docker rmi ${selected_image_name}"
}

print_and_exec(){
  command=$1
  echo "$command"
  bash -c "$command"
  echo ""
}



main "$1"