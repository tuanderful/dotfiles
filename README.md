# Dotfiles
My OSX / Ubuntu dotfiles.

## About this project
First off, this is a fork of [cowboy/dotfiles](https://github.com/cowboy/dotfiles), and you should start there. The rest of this has to do with **this specific dotfiles repo**, the changes and differences, and why those changes were made.

Dear future self, you had good reasons at the time.

> **OSX USAGE** You need to have [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a much smaller download.
>
> The easiest way to install the XCode Command Line Tools in OSX 10.9+ is to open up a terminal, type `xcode-select --install` and [follow the prompts](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

> **UBUNTU USAGE** you should at least update/upgrade APT with `sudo apt-get -qq update && sudo apt-get -qq dist-upgrade` first. Ben also has a [ansible script](https://github.com/cowboy/dotfiles/wiki/ubuntu-setup) if you want even more automation.

## Installing!
```sh
export github_user=YOUR_GITHUB_USER_NAME

bash -c "$(curl -fsSL https://raw.github.com/$github_user/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

Since you'll be using the [dotfiles][dotfiles] command on subsequent runs, you'll only have to export the `github_user` variable for the initial install.

There's a lot of stuff that requires admin access via `sudo`, so be warned that you might need to enter your password here or there.

## Major Differences from cowboy/dotfiles
* `copy/terminals/` contains a default "Solarized" themed terminal for both Terminal and iTerm. It's easier on the eyes, and works well with most CLI utilities. You can just run `open ~/terminals` to get a finder window and add from there.
* `init/30_osx_homebrew_casks.sh` contains additional casks for my personal workflow, including Mailbox by Dropbox, Flux, and SaveMonk for Dropbox
* `init/60_nvm.sh` contains setup of nvm for node.js and io.js
* `init/60_osx_defaults.sh` sets sensible OSX defaults for the mac OS, from https://github.com/s10wen/dotfiles/blob/master/.osx
* `init/99_app_store_reminders.sh` reminds you that there are things in the app store to get because they weren't available through homebrew / cask (or I was an idiot and didn't look first)
* `source/50_nvm.sh` is a manual initialization of nvm. This is to avoid having nvm modify the `.bashrc` file.
* `source/50_commacd.sh` is the commacd from shyiko: https://github.com/shyiko/commacd

## Refresher
### How the "dotfiles" command works
When [dotfiles][dotfiles] is run for the first time, it does a few things:

1. In Ubuntu, Git is installed if necessary via APT (it's already there in OSX).
1. This repo is cloned into your user directory, under `~/.dotfiles`.
1. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
1. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))
1. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename.
1. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 5 remembers what you selected the last time. The other steps are the same.

### Other subdirectories

* The `/backups` directory gets created when necessary. Any files in `~/` that would have been overwritten by files in `/copy` or `/link` get backed up there.
* The `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
* The `/caches` directory contains cached files, used by some scripts or functions.
* The `/conf` directory just exists. If a config file doesn't **need** to go in `~/`, reference it from the `/conf` directory.
* The `/source` directory contains files that are sourced whenever a new shell is opened (in alphanumeric order, hence the funky names).
* The `/test` directory contains unit tests for especially complicated bash functions.
* The `/vendor` directory contains third-party libraries.

### The "copy" step
Any file in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

### The "link" step
Any file in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

### The "init" step
Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

#### OS X

* Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script
* Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script
* Homebrew recipes via the [init/30_osx_homebrew_recipes.sh](init/30_osx_homebrew_recipes.sh) script
* Homebrew casks via the [init/30_osx_homebrew_casks.sh](init/30_osx_homebrew_casks.sh) script
* [Fonts](/cowboy/dotfiles/tree/master/conf/osx/fonts) via the [init/50_osx_fonts.sh](init/50_osx_fonts.sh) script

#### Ubuntu
* APT packages and git-extras via the [init/20_ubuntu_apt.sh](init/20_ubuntu_apt.sh) script

#### Both
* Node.js, npm and nave via the [init/50_node.sh](init/50_node.sh) script
* Ruby, gems and rbenv via the [init/50_ruby.sh](init/50_ruby.sh) script
* Some additional nice things in the neat init area

## Inspiration
<https://github.com/gf3/dotfiles>  
<https://github.com/mathiasbynens/dotfiles>  
(and 15+ years of accumulated crap)

## License
Copyright (c) 2014 "Cowboy" Ben Alman  
Licensed under the MIT license.  
<http://benalman.com/about/license/>
