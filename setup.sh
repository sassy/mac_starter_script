#!/bin/zsh

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
brew install --cask obsidian
brew install --cask proxyman
brew install --cask alt-tab
brew install --cask appcleaner
brew install --cask keyboardcleantool
brew install --cask karabiner-elements
brew install --cask realforce
brew install --cask spotify

brew install git
brew install awscli
brew install yarn
brew install anyenv
brew install direnv
brew install jq
brew install gh
brew install tree
brew install tmux
brew install peco
brew install ghq
brew install sheldon
brew install chezmoi

# cliコマンド 代替
brew install eza
brew install bat
brew install fd

brew install --cask xcodes

# anyenv update
if [ ! -d $HOME/.anyenv ] ; then
  anyenv install --init
  echo 'eval "$(anyenv init -)"' >> ~/.zshrc
  source ~/.zshrc
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  anyenv update
fi

if [ ! -d $HOME/.anyenv/envs/nodenv ] ; then anyenv install nodenv ; fi
if [ ! -d $HOME/.anyenv/envs/pyenv ]  ; then anyenv install pyenv ;  fi
if [ ! -d $HOME/.anyenv/envs/rbenv ]  ; then anyenv install rbenv ;  fi
if [ ! -d $HOME/.anyenv/envs/tfenv ]  ; then anyenv install tfenv ;  fi

# zshプラグインの設定
if [ ! -e $HOME/.config/sheldon/plugins.toml ] ; then
  sheldon init --shell zsh
  echo 'eval "$(sheldon source)"' >> ~/.zshrc
  source ~/.zshrc
  sheldon add zsh-completions --github zsh-users/zsh-completions
  sheldon add zsh-syntax-highlighting --github zsh-users/zsh-syntax-highlighting
  sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions
  sheldon source
fi

# githubに接続するためのsshキーは1passwordを使う
if [ ! -d $HOME/.ssh ] ; then
  mkdir ~/.ssh
  chmod 700 ~/.ssh
fi

if [ ! -e $HOME/.ssh/config ] ; then
  cd ~/.ssh
  touch ~/.ssh/config
  chmod 600 ~/.ssh/config
  echo 'Host *
    IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"' >> ~/.ssh/config
  cd ../
fi

# .gitconfigを取得
if [ ! -e $HOME/.gitconfig ] ; then
  curl -fsSL -o .gitconfig https://raw.githubusercontent.com/sassy/dotfiles/refs/heads/master/.gitconfig
fi