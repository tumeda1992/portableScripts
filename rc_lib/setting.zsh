# https://rcmdnk.com/blog/2015/07/24/computer-bash-zsh/
# https://qiita.com/yudoufu/items/48cb6fb71e5b498b2532
cur_dir=$(cd $(dirname ${BASH_SOURCE:-$0}) > /dev/null && pwd)
source ${cur_dir}/parts_config/common_sh_rc.sh

# https://qiita.com/tonosama/items/50c043ebc89009ad95be

# Lines configured by zsh-newuser-install
export EDITORP=vim #エディタをvimに設定
export LANG=ja_JP.UTF-8 #文字コードをUTF-8に設定

# history
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=100000
setopt extended_history #ヒストリに実行時間も保存
setopt hist_ignore_dups #直前と同じコマンドはヒストリに追加しない
his(){ history -i -100}

# <Tab>でパス名の補完候補を表示したあと、
# 続けて<Tab>を押すと候補からパス名を選択することができるようになる
zstyle ':completion:*:default' menu select=1

# cdの後にlsを実行
chpwd() { ls -latrhG  }

# https://qiita.com/ryutoyasugi/items/cb895814d4149ca44f12
# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%F{green}%~%f %n  %D{%Y-%m-%d} %*
%F{yellow}$%f '
RPROMPT='${vcs_info_msg_0_}'

# gitのブランチとかをタブ補完させたい場合
# (事前準備)
# $ brew install zsh-completions
# $ brew install zsh-autosuggestions
# $ brew install zsh-syntax-highlighting
# $ rm -f ~/.zcompdump; compinit
# # ターミナル起動ごとにwarningが出るのを防ぐ
# chmod -R go-w "$(brew --prefix)/share"

# 設定
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#   source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#   source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#   autoload -Uz compinit && compinit
#   autoload -Uz colors && colors
# fi


