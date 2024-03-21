#!/bin/bash

# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Language for command line tools
export LANG=en_US.UTF-8

# Homebrew
export PATH=/usr/local:/usr/local/bin:/usr/local/sbin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brew bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Disable annoying apple message "The default interactive shell is now zsh."
export BASH_SILENCE_DEPRECATION_WARNING=1

# Rbenv
eval "$(rbenv init --no-rehash -)"

# # Source extra at last
[ -r ~/.extra ] && source ~/.extra
