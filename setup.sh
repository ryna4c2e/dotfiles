## setting up dotfiles
# zsh
ln -ivs $PWD/zshrc ~/.zshrc
ln -ivs $PWD/git-prompt.sh ~/.git-prompt.sh
ln -ivs $PWD/zprofile ~/.zprofile

# emacs
mkdir -vp ~/.emacs.d/
ln -ivs $PWD/init.el ~/.emacs.d/init.el
test -e ~/.emacs && echo '!!!warning .emacs file exists. should be removed'

# keyboard layouts
mkdir -vp ~/Library/Keyboard\ Layouts
ln -ivs $PWD/Dvorak-JP.icns      ~/Library/Keyboard\ Layouts
ln -ivs $PWD/Dvorak-JP.keylayout ~/Library/Keyboard\ Layouts
ln -ivs $PWD/Dvorak-R.icns      ~/Library/Keyboard\ Layouts
ln -ivs $PWD/Dvorak-R.keylayout ~/Library/Keyboard\ Layouts

