#! /bin/bash

curPath=$(dirname $0)
gpullCmd="git pull origin $(${curPath}/currentBranch.sh);"
echo "$gpullCmd"
bash -c "$gpullCmd"
