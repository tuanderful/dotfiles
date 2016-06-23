e_header "Installing SCM Breeze"

git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze

# disable profile locations
for rc in bashrc zshrc bash_profile; do
  if [ -s "$HOME/.$rc" ]; then
    mv $HOME/.$rc $HOME/.$rc.temp
  fi
done

# install
~/.scm_breeze/install.sh

# restore profile locations
for rc in bashrc zshrc bash_profile; do
  if [ -s "$HOME/.$rc.temp" ]; then
    mv $HOME/.$rc.temp $HOME/.$rc
  fi
done
