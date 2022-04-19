#!/bin/bash

# check Homebrew
brew_check="/bin/bash -c 'brew --version >/dev/null 2>&1'"
brew_install="/bin/bash -c 'curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'"
zsh_install="/bin/bash -c brew install zsh'"
OMZ_install="sh -c 'curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'"

config_move="/bin/bash -c 'mv ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist'"

# Install Homebrew
while true; do
	eval "$brew_check"

	if [[ "$?" -ne 0 ]]; then
		eval "$brew_install"
	else
		break
	fi
done

if [[ "$?" -eq 0 ]]; then
	# Install ZSH
	eval "$zsh_install"
	fi

# Install Oh-My-Zsh
eval "$OMZ_install"

# Modify ~/.zshrc
# Change Theme to agnoster
sed -i -e 's/ZSH_THEME=\"\"/ZSH_THEME=\"agnoster\"/g' ~/.zshrc

# plugins=(git git-prompt)

# Set Highlighting


# Download D2Coding

# Move iTerm2 config
eval "$config_move"
