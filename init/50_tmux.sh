# Installs tmux with basic plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#  From: https://github.com/tmux-plugins/tpm/wiki/Installing-plugins-via-the-command-line-only
# start tmux and create a session but don't attach to it
tmux new-session -d
# install the plugins
tmux run "~/.tmux/plugins/tpm/scripts/install_plugins.sh"
# killing the session is not required
tmux kill-session
