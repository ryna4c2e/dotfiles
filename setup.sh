## setting up dotfiles
set -u

# zsh
ln -ivs $PWD/zshrc ~/.zshrc
ln -ivs $PWD/zshenv ~/.zshenv
ln -ivs $PWD/git-prompt.sh ~/.git-prompt.sh
ln -ivs $PWD/zprofile ~/.zprofile

# emacs
mkdir -vp ~/.emacs.d/
ln -ivs $PWD/init.el ~/.emacs.d/init.el
test -e ~/.emacs && echo '!!!warning .emacs file exists. should be removed'

# keyboard layouts
mkdir -vp ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-JP.icns      ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-JP.keylayout ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-R.icns      ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-R.keylayout ~/Library/Keyboard\ Layouts

# VSCode
VSCODE_USER_PATH=~/Library/Application\ Support/Code/User
mkdir -vp $VSCODE_USER_PATH
ln -ivs $PWD/vscode-keybindings.json "$VSCODE_USER_PATH/keybindings.json"
ln -ivs $PWD/vscode-settings.json "$VSCODE_USER_PATH/settings.json"
