# OSX-only stuff. Abort if not OSX.
is_osx || return 1

git clone https://github.com/arialdomartini/oh-my-git.git $HOME/.oh-my-git

open "https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched"
