curDir=$(cd $(dirname ${BASH_SOURCE:-$0}) > /dev/null && pwd)
gitRoot=$(cd $(dirname $(dirname $curDir)) > /dev/null && pwd)

# alias r='ruby' # ビルトインと競合する

# 初期起動時のブランチをキャッシュしてしまうのでaliasで設定したコマンド実行時に毎回取得するようにした
# currentBranch=$(git branch | grep '\*'  | awk '{print $2}')

function git_tag_and_show_push() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  local datetime=$(date +%Y%m%d%H%M%S)
  local tag="${branch}-${datetime}"

  git tag "$tag"
  echo "git push origin $tag"
}

# git alias
alias gdh='git diff HEAD^..HEAD'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias gpush="${gitRoot}/git_scripts/gitPushOriginCurBranch.sh"
alias gpull="${gitRoot}/git_scripts/gitPullOriginCurBranch.sh"
alias gsave="${gitRoot}/git_scripts/git_save_all_change.sh -b"
alias gl1='git log --oneline --graph --decorate'
alias gtag='git_tag_and_show_push'

# ruby/rails alias
alias rs='bundle exec rails'

# TODO aliasでのgpull廃止。aliasにcurBranchのキャッシュ残るから。スクリプトでgpullできるようにして、gpullエイリアスでそのスクリプトを指定する

# top
alias topc='top -o cpu'
alias topm='top -o mem'

# docker
alias dei='docker exec -it'
de() {
  local container_name=$1
  if [ -z "$container_name" ]; then
    echo "コンテナ名を指定してください。"
    return 1
  fi
  docker exec -it "${container_name}" bash
}





