#!/bin/bash

# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Brew bash completion
if type brew 2&>/dev/null; then
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi

# Language for command line tools
export LANG=en_US.UTF-8

# Homebrew
export PATH=/usr/local:/usr/local/bin:/usr/local/sbin:$PATH

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Disable annoying apple message "The default interactive shell is now zsh."
export BASH_SILENCE_DEPRECATION_WARNING=1

# Rustup configuration
export PATH="$HOME/.cargo/bin:$PATH"

# Rbenv
eval "$(rbenv init -)"
