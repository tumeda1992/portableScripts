#! /bin/bash

curPath=$(dirname $0)
gpushCmd="git push origin $(${curPath}/currentBranch.sh);"
echo "$gpushCmd"
bash -c "$gpushCmd"
