# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
  lang=c
  ;;
esac


## Default shell configuration
#
autoload colors
colors

# right prompt(display git branch)
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# set prompt
#
case ${UID} in
0)
  PROMPT="%{${fg[green]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[yellow]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[yellow]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}"
  ;;
*)
  PROMPT="%{${fg[green]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[yellow]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}"
  ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

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

alias grep="grep --color"
alias pd="popd"

## mysql prompt
#
m_color0=$'\e[1;36m'
m_color1=$'\e[1;33m'
m_clear=$'\e[0m'
export MYSQL_PS1="$m_color0(\d)$m_color1> $m_clear"


## terminal configuration
#
case "${TERM}" in
screen)
  TERM=xterm
  ;;
esac

case "${TERM}" in
xterm|xterm-color)
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
kterm-color)
stty erase '^H'
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
kterm)
  stty erase '^H'
  ;;
cons25)
  unset LANG
  export LSCOLORS=gxFxCxdxBxegedabagacad
  export LS_COLORS='di=36;49:ln=35;49:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
jfbterm-color)
  export LSCOLORS=gxFxCxdxBxegedabagacad
  export LS_COLORS='di=36;49:ln=35;49:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
*)
  export LSCOLORS=gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
  xterm|xterm-color|kterm|kterm-color)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  ;;
esac


## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# npm
export PATH="/usr/local/share/npm/bin:$PATH"
