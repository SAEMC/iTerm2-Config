#!/bin/bash

brew_check="/bin/bash -c 'brew --version >/dev/null 2>&1'"

# Install Homebrew
while true; do
	eval "$brew_check"

	if [[ "$?" -ne 0 ]]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	else
		break
	fi
done

if [[ "$?" -eq 0 ]]; then
	# Install ZSH
	/bin/bash -c "brew install zsh"
fi

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZSH Change Theme to agnoster
sed -i '' 's/ZSH_THEME="robyrussell"/ZSH_THEME="agnoster"/g' ${HOME}/.zshrc

# ZSH Disappear Username
echo "# ZSH Disappear Username" >>${HOME}/.zshrc
echo "prompt_context() {}" >>${HOME}/.zshrc

# ZSH Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting/
echo "# ZSH Highlighting" >>${HOME}/.zshrc
echo "source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>${HOME}/.zshrc

# Download D2Coding
git clone https://github.com/naver/d2codingfont.git
mv ./d2codingfont/D2Coding-Ver1.3.2-20180524.zip . && \
unzip D2Coding-Ver1.3.2-20180524.zip
mv ./D2Coding/* ${HOME}/Library/Fonts/ && \
mv ./D2CodingLigature/* ${HOME}/Library/Fonts/ && \
mv ./D2CodingAll/* ${HOME}/Library/Fonts/

# Move iTerm2 config
mv ./com.googlecode.iterm2.plist ${HOME}/Library/Preferences/com.googlecode.iterm2.plist

/bin/zsh -c "source ${HOME}/.zshrc"
