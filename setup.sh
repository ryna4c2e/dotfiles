## setting up dotfiles
set -u

# zsh
ln -ivs $PWD/zshrc ~/.zshrc
ln -ivs $PWD/zshenv ~/.zshenv
ln -ivs $PWD/git-prompt.sh ~/.git-prompt.sh
ln -ivs $PWD/zprofile ~/.zprofile

# keyboard layouts
mkdir -vp ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-JP.icns      ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-JP.keylayout ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-R.icns      ~/Library/Keyboard\ Layouts
cp -iv $PWD/Dvorak-R.keylayout ~/Library/Keyboard\ Layouts

