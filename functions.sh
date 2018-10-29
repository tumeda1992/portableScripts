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

# この関数を使用したいファイルで以下を書いてこのファイルを読み込んでください
# . path/to/dir/functions.sh

function isSuccessReadFunctions() {
  echo 関数ファイルの読込成功
}

function log() {
  # ログ出力
  # 関数でechoを行うと想定外の戻り値を増やしてしまう場合などに使用
  logMsg=$1
  logtime=$(date +%Y/%m/%d-%H:%M:%S)
  logStr=${logtime}$' '${logMsg}

  logfilePath="$2"
  
  echo ${logStr}
  if [ "${logfilePath}" != "" ]
  then
    echo ${logStr} >> ${logfilePath}
  fi
}

# 結局これは関数の戻り値に関係なかったためコメントアウト
# function writeStr2FileWithoutStdout(){
#   # ファイルへの文字列出力
#   # 関数でechoを行うと想定外の戻り値を増やしてしまう場合などに使用
#   # 
#   # 実行済みテスト
#   # echo 更新前の古い文字列 > test.log
#   # writeStr2FileWithoutStdout 強制更新ファイル文字列 test.log -f
#   # writeStr2FileWithoutStdout リダイレクト文字列 test.log
#   # echo -e $(cat test.log)

  
#   forceUpdate=0
#   haveOpt=0
#   while getopts f OPT
#   do
#     case $OPT in
#       f) forceUpdate=1
#       haveOpt=1
#       ;;
#     esac
#   done
#   if [ ${haveOpt} = 1 ]
#   then
#     shift $(($OPTIND - 1))
#   fi

#   str=$1
#   filePath="$2"

#   if [ ${forceUpdate} = 1 ]
#   then
#     echo ${str} > ${filePath}
#   else
#     echo ${str} >> ${filePath}
#   fi
# }

function getLastArgElem(){
  argList=()
  # $@はすべての引数
  for arg in "$@"
  do
    argList+=("$arg")
  done

  echo "${argList[${#argList[@]}-1]}"
}

# 結局これ使うのって標準出力をログとして出して、
# そのうえで最後の標準出力を得ようとしてるけど
# 関数の結果を出すときは$(func)で書いて、
# 結局func内の標準出力はログで出されないから、この関数使わない
# 
# 上記用途の場合、バッドプラクティスだけどグローバル変数使うくらいしかない
# function extractLastFuncElem(){
#   getLastArgElem $@
# }