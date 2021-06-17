#!/bin/bash

# Symlink each dotfile in the home directory
# TODO : Backup existing dotfile first

for name in .{bash_prompt,exports,aliases,functions,bashrc,bash_profile,gitignore_global,extra,alacritty.yml}; do
  source="$PWD/$name"
  target="$HOME/$name"
  echo "-----> Symlinking $source to $target"
  ln -s "$source" "$target"
done
