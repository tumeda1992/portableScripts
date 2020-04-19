#! /bin/bash

main () {
  exit_in_function
  echo "exit_in_function後のアクション"
}

exit_in_function() {
  echo "in 'exit_in_function'"
  exit 0
  # 関数内でexit実行してスクリプトの処理を終わらせられる！
}


main