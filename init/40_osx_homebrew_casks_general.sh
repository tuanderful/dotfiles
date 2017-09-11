# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# setup Cask for install
[[ ! $(type -t cask_ready) == function ]] && source $DOTFILES/init/20_osx_homebrew.sh

# Exit if, for some reason, cask is not installed.
[[ ! "$(brew cask --version)" ]] && e_error "Brew-cask failed to install." && return 1

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Graveyard Note
# check git history on this file. There are nice things I just don't use
# so I've removed them for speed.

# Homebrew casks
casks=(
  adobe-creative-cloud
  atom
  battle-net
  bettertouchtool
  colorpicker-developer
  colorpicker-skalacolor
  charles
  crossover
  d235j-xbox360-controller-driver
  dropbox
  firefox
  fluid
  google-chrome
  hex-fiend
  imageoptim
  iterm2
  loopback
  moom
  obs
  remote-desktop-connection
  skype
  slack
  sonos
  sookasa
  steam
  suspicious-package
  the-unarchiver
  vlc
  yubiswitch
)

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
  brew cask cleanup
fi

# Work around colorPicker symlink issue.
# https://github.com/caskroom/homebrew-cask/issues/7004
cps=()
for f in ~/Library/ColorPickers/*.colorPicker; do
  [[ -L "$f" ]] && cps=("${cps[@]}" "$f")
done

if (( ${#cps[@]} > 0 )); then
  e_header "Fixing colorPicker symlinks"
  for f in "${cps[@]}"; do
    target="$(readlink "$f")"
    e_arrow "$(basename "$f")"
    rm "$f"
    cp -R "$target" ~/Library/ColorPickers/
  done
fi
