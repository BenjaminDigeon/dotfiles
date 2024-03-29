#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# -- Brew formulas --

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Better ls
brew install exa

# Wget
brew install wget

# Git
brew install git
brew install git-lfs

# Batch completion
brew install bash-completion

# Htop
brew install htop

# Micro text editor
brew install micro

# Nmap
brew install nmap

# Mics
brew install rename
brew install tree

# Sqlite
brew install sqlite

# Rbenv for managing ruby versions
brew install rbenv

# Python
brew install python

# Rust
brew install rustup-init

# Linter for Shell scripts
brew install shellcheck

# -- Cask formulas --

# Window management
brew install --cask rectangle

# Docs
brew install --cask devdocs

# Keeping the mac awake
brew install --cask keepingyouawake

# Best terminal
brew install --cask iterm2

# JetBrain Mono Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Remove outdated versions from the cellar
brew cleanup
