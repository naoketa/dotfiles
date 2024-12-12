# environment variables
export LANG=ja_JP.UTF-8
export KCODE=u #UTF-8
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# color
autoload -Uz colors
colors

# complement
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt print_eight_bit

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# prompt
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'    
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'    

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}    
#add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{blue}localhost%f:%1(v|%F{red}%1v%f|) $ "
RPROMPT='[%F{green}%d%f]'

## PATH
# core
export PATH=$HOME/bin:/usr/local/bin:$PATH

## alias
# core
alias ls='gls --color=auto'
alias l='ls'
alias ll='ls -l'
alias rm='rm -i'
alias his='history | grep $1'

# git
alias gst='git status'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push'
alias gcm='commit -m'
alias gsh='git stash'
alias gri='git rebase -i'
