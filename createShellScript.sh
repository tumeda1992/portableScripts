#! /bin/bash
filename=$1

touch ${filename}
chmod +x ${filename}
echo "#! /bin/bash" >> ${filename}

echo "" >> ${filename}
echo "#（オプション）このファイルを作業ディレクトリとする" >> ${filename}
echo "#cd \$(dirname \$0)" >> ${filename}

echo "##（オプション）オプション引数を使う場合は以下を使用" >> ${filename}
echo "#haveOpt=0" >> ${filename}
echo "#while getopts f:dc: OPT" >> ${filename}
echo "#do" >> ${filename}
echo "#  case \$OPT in" >> ${filename}
echo "#    f) filename=\"\$OPTARG\"" >> ${filename}
echo "#      haveOpt=1" >> ${filename}
echo "#      ;;" >> ${filename}
echo "#    d) isDebug=1" >> ${filename}
echo "#      haveOpt=1" >> ${filename}
echo "#      ;;" >> ${filename}
echo "#    c) count='\$OPTARG'" >> ${filename}
echo "#      haveOpt=1" >> ${filename}
echo "#      ;;" >> ${filename}
echo "#  esac" >> ${filename}
echo "#done" >> ${filename}
echo "#" >> ${filename}
echo "#if [ \${haveOpt} = 1 ]" >> ${filename}
echo "## オプションがある場合、オプション分だけ引数をずらす（これがないと-fなどが\$1に入る）" >> ${filename}
echo "#then" >> ${filename}
echo "#  shift \$((\$OPTIND - 1))" >> ${filename}
echo "#fi" >> ${filename}
