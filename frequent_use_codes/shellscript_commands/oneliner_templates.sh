# ファイル名と内容を出力
for file in $(ls *.*); do echo $file; cat $file; echo ""; done

# ファイル概略把握
file="hoge.csv" && wc -l $file && head $file && echo "..." && tail $file
