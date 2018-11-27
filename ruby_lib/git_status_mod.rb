# TODO このファイルの処理を関数化してlibにセット。json形式で返し、gitstatusをモジュール化


BRANCH_NAME_MATCHER_STR = "On branch "
MODE_ADDED_ITEMS = "MODE_ADDED_ITEMS"

def git_status_json()
  branch_name = ""
  mode = ""

  # デバッグ用
  cnt = 0

  # コマンド実行
  git_status = `git status`
  git_status_str_list = git_status.split("\n")
  for git_status_str in git_status_str_list do
    cnt += 1

    # スキップ
    next if git_status_str.include?("(use")
    next if git_status_str.strip == ""

    # 現ブランチ名取得
    if git_status_str.include?(BRANCH_NAME_MATCHER_STR) then
      # 正規表現　https://qiita.com/shizuma/items/4279104026964f1efca6
      branch_name = git_status_str.match(/On branch (.+)/)[1]
      p "branch_name: #{branch_name}"
      next
    end

    # モード切り替え
    mode = MODE_ADDED_ITEMS if git_status_str.include?("Changes to be committed:")

    # add済みを無視
    # if git_status_str
    
    ## 差分ありの未addファイル
    #if git_status_str
    #
    #end
    ## 未add新規ファイル
    #if git_status_str
    #
    #end
    
    p "デバッグ；行" + cnt.to_s 
      
  end

  # git status 結果
  #On branch master
  #Changes to be committed:
  #  (use "git reset HEAD <file>..." to unstage)
  #
  #	modified:   modified_and_added.txt
  #	new file:   newnew.txt
  #
  #Changes not staged for commit:
  #  (use "git add <file>..." to update what will be committed)
  #  (use "git checkout -- <file>..." to discard changes in working directory)
  #
  #	modified:   modified.txt
  #
  #Untracked files:
  #  (use "git add <file>..." to include in what will be committed)
  #
  #	added.txt
  #	test.rb
end