# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git
