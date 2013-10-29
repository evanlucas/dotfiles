#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR"/bash/functions

create_bash_dirs() {
  print_info "creating bash dirs..."
  mkdir -p ~/bin/bash
}

setup_mac() {
  print_info "modifying default finder settings..."
  print_info "Show status bar"
	defaults write com.apple.finder ShowStatusBar 1
	print_info "Show path bar"
  defaults write com.apple.finder ShowPathBar 1
	print_info "Show external drives on desktop"
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop 1
	print_info "Don't show hard drives on desktop"
  defaults write com.apple.finder ShowHardDrivesOnDesktop 0
	print_info "Don't show mounted servers on desktop"
  defaults write com.apple.finder ShowMountedServersOnDesktop 0
	print_info "Show removable media on desktop"
  defaults write com.apple.finder ShowRemovableMediaOnDesktop 1
	print_info "Default to column layout"
  defaults write com.apple.finder FXPreferredViewStyle clmv
	print_info "Disable dashboard"
	defaults write com.apple.dashboard mcx-disabled -boolean YES # Disable dashboard
	print_info "Enable tap to click"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking 1
	print_info "Enable three finger drag"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag 1
	killall Dock
  create_bash_dirs
  print_info "symlinking bash files..."
  ln -fs ~/dev/dotfiles/bash/.bash_profile ~/.bash_profile
  ln -fs ~/dev/dotfiles/bash/* ~/bin/bash
  print_info "getting rid of parallels ads...thanks @chronic"
  defaults write com.parallels.Parallels\ Desktop ProductPromo.ForcePromoOff -bool YES
  if [[ -d "/Applications/Coda\ 2.app" ]]; then
    print_info "copying coda 2 theme"
    ln ~/dev/dotfiles/other/NightLion.sss ~/Library/Application\ Support/Coda\ 2/Styles/
  fi
}

setup_ubuntu() {
  create_bash_dirs
  print_info "symlinking bash files..."
  ln -fs ~/dev/dotfiles/bash/.bash_profile ~/.profile
  ln -fs ~/dev/dotfiles/bash/functions ~/bin/bash/functions
  ln -fs ~/dev/dotfiles/bash/colors ~/bin/bash/colors
  echo "export TERM=\"xterm-256color\"" >> ~/.bashrc
  echo ". ~/.profile" >> ~/.bashrc
}

setup_other() {
  create_bash_dirs
  print_info "symlinking bash files..."
  ln -fs ~/dev/dotfiles/bash/.bash_profile ~/.profile
  ln -fs ~/dev/dotfiles/bash/functions ~/bin/bash/functions
  ln -fs ~/dev/dotfiles/bash/colors ~/bin/bash/colors
  echo ". ~/.profile" >> ~/.bashrc
}

if [[ ! -d ~/dev/dotfiles ]]; then
	print_error "Invalid location...aborting"
	exit
fi

print_info "symlinking vim files..."
ln -fs ~/dev/dotfiles/.vim* ~/


if [[ $(uname) == "Darwin" ]]; then
	setup_mac
elif [[ $(lsb_release -i -s) == "elementary OS" ]]; then
  setup_ubuntu
elif [[ $(lsb_release -i -s) == "Ubuntu" ]]; then
  setup_ubuntu
else
  setup_other
fi

print_info "symlinking git files..."
ln -fs ~/dev/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/dev/dotfiles/.gitignore ~/.gitignore

print_info "done setting up env..."
