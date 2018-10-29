#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
#cd $(dirname $0)
#（オプション）オプション引数を使う場合は以下を使用
#while getopts f:dc: OPT
#do
#  case  in
#    f) filename=;;
#    d) isDebug=1;;
#    c) count=;;
#  esac
#done

. ./functions.sh

echo 更新前の古い文字列 > test.log
writeStr2FileWithoutStdout -f 強制更新ファイル文字列 test.log
writeStr2FileWithoutStdout リダイレクト文字列 test.log
echo -e $(cat test.log)