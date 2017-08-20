alias ls="ls -AhvF1l"
alias l="ls -AhvF1"
alias cd..="cd .."
alias rm="echo"
alias rmdir="echo"
alias cp="cp -i"
alias mv="mv -i"
alias javac="javac -J-Dfile.encoding=UTF-8 -encoding UTF-8 -Xlint:unchecked"
alias java="java -Dfile.encoding=UTF-8"

alias editpref="vi ~/.zshrc"
alias editenvs="open ~/.MacOSX/environment.plist"
alias calc='open -a Calculator.app'

alias gosh="rlwrap gosh"
alias ocaml="rlwrap ocaml"
alias clisp="clisp -q -on-error abort"
alias sbcl="rlwrap sbcl"
alias swipl="swipl -q"
alias bc="bc -q"
alias ed="ed -p '> '"
alias csi="rlwrap csi -q"

alias youtube-webm="youtube-dl -f 248+251"

alias blender="/Applications/Blender.app/Contents/MacOS/blender"

autoload -Uz compinit
compinit -u

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z} r:|[-_.]=**'


bindkey -e

HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt autocd auto_pushd correct nolistbeep cdablevars histignoredups noclobber extended_history share_history

# Prompt shows git status

source ~/.git-prompt.sh
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT

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

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

cd ~/Desktop/
