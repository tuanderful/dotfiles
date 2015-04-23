# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# App Store Stuff to Go Get
apps=(
  "Fantastical 2"
  "Tweetbot for Twitter"
  "Keynote"
  "Numbers"
  "Pages"
  "OmniFocus 2"
  "Slack"
  "OmniGraffle Pro"
  "Evernote"
)

if (( ${#apps[@]} > 0 )); then
  e_header "App Store Installation Required:"
  for app in "${apps[@]}"; do
    echo "  $app"
  done
fi
