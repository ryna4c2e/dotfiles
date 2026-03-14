# homebrew switcher
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

export PATH="$HOME/.local/share/mise/shims:$PATH"
source "$HOME/.rye/env"
