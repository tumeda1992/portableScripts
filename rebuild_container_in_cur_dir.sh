#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
#cd $(dirname $0)
##（オプション）オプション引数を使う場合は以下を使用
haveOpt=0
while getopts p: OPT
do
  case $OPT in
    p) port="$OPTARG"
      haveOpt=1
      ;;
  esac
done

if [ ${haveOpt} = 1 ]
# オプションがある場合、オプション分だけ引数をずらす（これがないと-fなどが$1に入る）
then
  shift $(($OPTIND - 1))
fi

# #########################################################################
# シェル実行ディレクトリのDockerfileでイメージコンテナ作成
# (元々コンテナがあれば除去して再作成)
# ※ Windowsの場合Users/以下でないとマウントが成功しないので、
# Users/配下にプロジェクトのディレクトリのシンボリックリンクを作る必要あり
# #########################################################################

option=""
if [ ${port} != "" ]
then
  option="${option} -p ${port}:${port}"
fi

prj_name=$(basename ${PWD})

echo "remove existing image"
docker stop ${prj_name}
docker rm ${prj_name}
docker rmi ${prj_name}

echo ""
echo "build new image and container"
docker build -t ${prj_name} .
# 暫定対応　DockerfileでうまくVOLUME指定できないからコマンド実行時に指定
docker run -d -i \
           --name "${prj_name}" \
           -v ${PWD}:/usr/src/${prj_name} \
           ${option} \
           ${prj_name} 
           
echo ""
# echo "（デバッグ）pwd:${PWD}"

echo ""
echo "##以下コンテナに入るコマンド##"
echo docker exec -it ${prj_name} bash
