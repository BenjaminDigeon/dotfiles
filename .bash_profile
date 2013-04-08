# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

#Set the $HTTP_PROXY
set_http_proxy

# init rvm (/!\ in the bottom of bash_profile)
source ~/.rvm/scripts/rvm