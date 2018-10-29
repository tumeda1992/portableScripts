#! /bin/bash

#（オプション）このファイルを作業ディレクトリとする
cd $(dirname $0)
#（オプション）オプション引数を使う場合は以下を使用
#while getopts f:dc: OPT
#do
#  case  in
#    f) filename=;;
#    d) isDebug=1;;
#    c) count=;;
#  esac
#done

/usr/bin/git add .
/usr/bin/git commit -m 'auto commit'

/usr/bin/git push
