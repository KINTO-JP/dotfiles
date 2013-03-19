# autoload
autoload -U colors
colors
autoload -U compinit
compinit
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# does not pushd the same directory.
setopt pushd_ignore_dups
# auto change directory
setopt auto_cd
setopt cdable_vars
# command correct edition before each completion attempt
setopt correct
 
# zstyle
zstyle ':completion:*' menu select true
# directory = blue, symbolic link = magenta
zstyle ':completion:*' list-colors 'di=34;49' 'ln=35;49'
   
# standard prompt
PROMPT="%{${fg[cyan]}%}%n%{${fg[yellow]}%}-> %{${reset_color}%}"

# right prompt(display git branch)
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
} 
RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# spell correction prompt
SPROMPT="%{${fg[red]}%}%r%{${reset_color}%} is correct? [n,y,a,e]: "

# mysql prompt
m_color0=$'\e[1;36m'
m_color1=$'\e[1;33m'
m_clear=$'\e[0m'
export MYSQL_PS1="$m_color0(\d)$m_color1> $m_clear"

# colorstyle (ls)
LS_COLORS="di=34;49:ln=35;49"

# Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# ignore duplication command history list
setopt hist_ignore_dups
# share command history data
#setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
#alias ls="ls -F --color=auto"
alias ls="ls -F"
alias sl="ls"
alias ll="ls -l"
alias la="ls -A"
alias al="ls -A"
alias lla="ls -Al"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias grep="grep --color"
alias pd="popd"

alias less="/usr/share/vim/vim72/macros/less.sh"

