#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

filename=$1

cp "${this_script_dir}/template.sh" ${filename}
chmod +x ${filename}