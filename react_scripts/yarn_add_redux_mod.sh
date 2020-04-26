#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

. ${this_script_dir}/log_functions.sh

main () {
  exec_command "yarn add redux react-redux"
  exec_command "yarn add redux-devtools-extension"
  exec_command "yarn add axios redux-thunk"
  exec_command "yarn add react-router-bootstrap"
  exec_command "yarn add redux-form"
  exec_command "yarn add react-router-dom react-router-bootstrap"
  exec_command "yarn add immutable"
}

exec_command () {
  command="$1"
  log_this_script_message "$command"
  /bin/bash -c "$command"
  if [ $? != 0 ]; then exit_with_error; fi
}

main
