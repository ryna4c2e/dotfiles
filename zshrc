alias ls="ls -AhvF1l"
alias l="ls -AhvF1"
alias cd..="cd .."
alias rm="echo"
alias rmdir="echo"
alias cp="cp -i"
alias mv="mv -i"

alias bc="bc -q"
alias ed="ed -p '> '"
alias gitstatus="git status"

alias g++='g++-13 -std=gnu++23 -Wall -Wextra'

autoload -Uz compinit
compinit -u

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z} r:|[-_.]=**'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

bindkey -e

HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd auto_pushd correct nolistbeep cdablevars histignoredups noclobber extended_history inc_append_history_time

# Prompt shows git status
source ~/.git-prompt.sh
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
setopt IGNOREEOF

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

autoload -Uz colors
colors
PROMPT="%{$fg[red]%}%%%{$reset_color%} "
precmd () {
  RPROMPT='$(__git_ps1 "(%s) ")[%c]'
}

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

zmodload -i zsh/mathfunc

umask 002

export PATH="~/bin:$PATH"

# homebrew switcher
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/akm/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export PATH="$HOME/.local/share/mise/shims:$PATH"

export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
