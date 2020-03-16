# ファイル名と内容を出力
for file in $(ls *.txt); do echo $file; cat $file; echo ""; done
