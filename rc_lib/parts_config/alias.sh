# alias r='ruby' # ビルトインと競合する

# 初期起動時のブランチをキャッシュしてしまうのでaliasで設定したコマンド実行時に毎回取得するようにした
# currentBranch=$(git branch | grep '\*'  | awk '{print $2}')
# git alias
alias gdh='git diff HEAD^..HEAD'
alias gs='git status'
alias gc='git checkout'
#gpullCmd="git pull origin $(curBranch);"
curBranch(){echo $(git branch | grep '\*'  | awk '{print $2}')}
#alias gpull="echo 'git pull origin $(curBranch)' ; sh -c 'git pull origin $(curBranch)'"
alias gpull="git pull origin"
alias gl1='git log --oneline --graph --decorate'

# ruby/rails alias
alias rs='bundle exec rails'

# TODO aliasでのgpull廃止。aliasにcurBranchのキャッシュ残るから。globalスクリプトディレクトリを作成してそこにパスを通し、どこでも実行できるように








