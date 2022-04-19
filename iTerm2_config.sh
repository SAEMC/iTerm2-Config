#!/bin/bash

brew_check="/bin/bash -c 'brew --version >/dev/null 2>&1'"

# Install Homebrew
while true; do
    eval "$brew_check"

    if [[ "$?" -ne 0 ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>${HOME}/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        break
    fi
done

# Install iTerm2
/bin/zsh -c "brew install --cask iterm2"

# Install Oh-My-Zsh
/bin/zsh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ZSH Change Theme
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ${HOME}/.zshrc

# ZSH Disappear Username
echo "\n# ZSH Disappear Username" >>${HOME}/.zshrc
echo "prompt_context() {}" >>${HOME}/.zshrc

# Download ZSH Highlighting / Set ZSH Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting/
echo "\n# ZSH Highlighting" >>${HOME}/.zshrc
echo "source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>${HOME}/.zshrc

# Set Newline
sed -i '' 's/^  prompt_end$/  prompt_newline\n  prompt_end/g' ${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme
cat >>${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme <<EOF

# Newline
prompt_newline() {
  if [[ -n \$CURRENT_BG ]]; then
    echo -n "%{%k%F{\$CURRENT_BG}%}\$SEGMENT_SEPARATOR
%(?.%F{\$CURRENT_BG}.%F{RED})>%f"
  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}
EOF

# Download D2Coding / Move D2Coding
git clone https://github.com/naver/d2codingfont.git
mv ./d2codingfont/D2Coding-Ver1.3.2-20180524.zip . && \
unzip D2Coding-Ver1.3.2-20180524.zip
mv ./D2Coding/* ${HOME}/Library/Fonts/ && \
mv ./D2CodingLigature/* ${HOME}/Library/Fonts/ && \
mv ./D2CodingAll/* ${HOME}/Library/Fonts/

# Move iTerm2 config (General)
mv ./com.googlecode.iterm2.plist ${HOME}/Library/Preferences/

/bin/zsh -c "source ${HOME}/.zshrc"
