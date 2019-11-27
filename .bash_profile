# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Brew bash completion
if type brew 2&>/dev/null; then
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi

# GPG
export GPG_TTY=$(tty)

# Language for command line tools
export LANG=en_US.UTF-8

# JDK1.8
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

# Homebrew
export PATH=/usr/local:/usr/local/bin:/usr/local/sbin:$PATH

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Last version of unzip
export PATH="/usr/local/opt/unzip/bin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

LANG=en_US.UTF-8

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.cargo/bin:$PATH"

# Disable annoying apple message "The default interactive shell is now zsh."
export BASH_SILENCE_DEPRECATION_WARNING=1
