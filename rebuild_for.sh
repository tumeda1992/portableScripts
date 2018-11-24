#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
#cd $(dirname $0)
##（オプション）オプション引数を使う場合は以下を使用
#haveOpt=0
#while getopts f:dc: OPT
#do
#  case $OPT in
#    f) filename='$OPTARG'
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

prj_name=$1

echo "remove existing image"
docker stop ${prj_name}
docker rm ${prj_name}
docker rmi ${prj_name}

echo ""
echo "build new image and container"
docker build -t ${prj_name} .
docker run -d -i --name "${prj_name}" ${prj_name} 
