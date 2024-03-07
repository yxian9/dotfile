# My dotfiles

This directory contains the dotfiles for my system macOS and Linux

## Requirements
Git and GNU stow are required to use these dotfiles.


## Installation
Check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:yxian9/dotfile.git
$ cd dotfile
```

then use GNU stow to create symlinks

```
$ stow .
```

brew install
```
brew install --cask google-chrome
brew install --cask bitwarden
brew install --cask iina
brew install --cask cyberduck
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask temurin ## JDK https://adoptium.net/ 
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask alacritty

brew install zoxide fzf lf fish bat ripgrep starship neovim miniforge tmux stow jq node yabai skhd bat  

## fisher setup
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install joshmedeski/fish-lf-icons

```


