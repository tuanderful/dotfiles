# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Ruby Gems is not installed / available.
[[ ! "$(type -P gem)" ]] && e_error "gem command for ruby is not available" && return 1

# Ruby Gems
gems=(
  jekyll
  pasteboard
)

e_header "Installing Ruby Gems:"
for gem in "${gems[*]}"; do
  gem install $gem
done
