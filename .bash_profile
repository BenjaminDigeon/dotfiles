# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init rvm (/!\ in the bottom of bash_profile)

#init git autocompletation
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source $(brew --prefix)/etc/bash_completion.d/hub.bash_completion.sh

#JDK1.7
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

#Ajout des bin Homebrew dans le PATH
export PATH=/usr/local:/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting