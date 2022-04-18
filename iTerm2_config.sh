#!/bin/bash

# check Homebrew
brew_check="/bin/bash -c 'brew --version >/dev/null 2>&1'"
brew_install="/bin/bash -c 'curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'"

# Install Homebrew
eval "$brew_check"

if [[ "$?" -ne 0 ]]; then
	eval "$brew_install"
fi

eval "$brew_check"

if [[ "$?" -eq 0 ]]; then
	# Install ZSH
	brew install zsh
fi

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Modify ~/.zshrc
# Change Theme to agnoster
sed -i -e 's/ZSH_THEME=\"\"/ZSH_THEME=\"agnoster\"/g' test.txt

# plugins=(git git-prompt)

# Set Highlighting


# Download D2Coding

# Move iTerm2 config to ~/Library
