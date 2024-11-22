#!/bin/bash

# homebrewをインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="$PATH:/opt/homebrew/bin"' >> ~/.zshrc
source ~/.zshrc

softwareupdate --install-rosetta --agree-to-license

# 必要なツール類
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask 1password
brew install --cask docker
brew install --cask raycast
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask onyx
brew install --cask figma
brew install --cask notion
brew install --cask proxyman
brew install --cask alt-tab

brew install git
brew install awscli
brew install yarn
brew install anyenv
brew install direnv
brew install jq
brew install gh
brew install tmux

brew install --cask xcodes

# anyenv update
echo 'eval "$(anyenv init -)"' >> ~/.zshrc
source ~/.zshrc
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv update

# githubに接続するためのsshキーの作成(生成後にコピーしてgithubに設定)
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa
chmod 400 ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa
touch ~/.ssh/config
chmod 600 ~/.ssh/config
echo "Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
  Port 22" >> ~/.ssh/config
cd ../
