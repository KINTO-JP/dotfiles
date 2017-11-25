# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# -------------------------------------
# zshの基本設定
# -------------------------------------

## Default shell configuration
autoload colors
colors

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# ビープを鳴らさない
setopt nobeep

# no beep sound when complete list displayed
setopt nolistbeep

# Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history

# Completion configuration
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u

# zsh editor
autoload zed

# 色を使う
setopt prompt_subst

# ^Dでログアウトしない。
setopt ignoreeof

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完:タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# -------------------------------------
# キーバインド
# -------------------------------------
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
bindkey -e
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# エイリアス
# -------------------------------------
# expand aliases before completing
setopt complete_aliases

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias sl="ls -F"
alias la="ls -a"
alias al="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -al"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias pd="popd"

alias tree="tree -NC"

alias vi="vim"

# brew doctorでConfigのWarrnigが表示されるのを回避
alias brew="env PATH=${PATH/\/Users\/#(whoami)\/\.pyenv\/shims:/} brew"

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls -all する
function chpwd() { ls -all }


# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

# mysql prompt
m_color0=$'\e[1;36m'
m_color1=$'\e[1;33m'
m_clear=$'\e[0m'
export MYSQL_PS1="$m_color0(\d)$m_color1> $m_clear"

## load user .zshrc configuration file
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine
