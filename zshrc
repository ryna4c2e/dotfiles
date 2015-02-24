alias ls="ls -AhvF1l"
alias l="ls -AhvF1"
alias cd..="cd .."
alias rm="echo"
alias rmdir="echo"
alias cp="cp -i"
alias mv="mv -i"
alias javac="javac -J-Dfile.encoding=UTF-8 -encoding UTF-8 -Xlint:unchecked"
alias java="java -Dfile.encoding=UTF-8"
alias xcc="gcc -L/usr/X11R6/lib -lX11"
alias glcc="gcc -framework OpenGL -framework GLUT"
alias sdlcc='gcc `sdl-config --cflags --libs` -lSDL_image'
alias objcc="gcc -framework Foundation"

#alias clang="clang-mp-3.2"
#alias clang++="clang++-mp-3.2 --std=c++11"
export INCLUDE_PATH="/opt/local/include:$INCLUDE_PATH"
export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"

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
alias gtc=". gtc"
alias csi="rlwrap csi -q"

autoload -U compinit
compinit

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

PROMPT="%% "
precmd () {
  RPROMPT='$(__git_ps1 "(%s) ")[%c]'
}

export INCLUDE=/opt/local/include:$INCLUDE
export PATH=/usr/local/Cellar/ruby/1.9.3-p286/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:~/.cabal/bin:/usr/local/bin:/opt/local/bin:$PATH:~/Dropbox/bin:~/Commands:/Applications/pTeX.app/teTeX/bin
export MANPATH=/opt/local/man:$MANPATH:/Applications/pTeX.app/teTeX/man
export TRASH=~/.Trash
export CGI_DIRECTORY=~/Sites/cgi-bin

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

zmodload -i zsh/mathfunc

alias xiang="xboard -variant xiangqi"


cd ~/Desktop/
