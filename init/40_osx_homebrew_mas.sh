# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P mas)" ]] && e_error "mas needs to be installed first via Homebrew" && return 1

targets=(
  # 411699771  # djay
  # 406056744  # Evernote
  # 1005325119 # FireStream
  # 408981381  # iPhoto
  # 443987910  # 1Password
  # 409183694  # Keynote
  # 434290957  # Motion
  # 409203825  # Numbers
  # 404645717  # OmniGraffle professional
  # 409201541  # Pages
  # 1134717305 # Polymail
  585829637  # Todoist
  497799835  # Xcode
  # 457622435  # Yoink
)

e_header "Installing Mac App Store Items via Homebrew/mas:"
for target in "${targets[*]}"; do
  mas install $target
done
