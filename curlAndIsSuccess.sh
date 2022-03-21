#! /bin/bash
url=$1

responseCode=$(curl -sS --max-time 86400 -w '%{http_code}\n' ${url} -o /dev/null)
if [ ${responseCode} = 200 ]
then
  echo 0 # 成功
else
  if [ ${responseCode} = 504 ]
  then
    echo 0 # 成功
  else
    echo 1 # 失敗
  fi
fi
