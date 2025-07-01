# My dotfiles

This directory contains the dotfiles for my system macOS and Linux

- [lazyVim](https://www.lazyvim.org/) - 💤 neovim distribution
- [lazygit](https://github.com/jesseduffield/lazygit) -  💤 terminal UI for git
- [kitty](https://github.com/kovidgoyal/kitty) - 🐱 a terminal that support true color and image protocol
- [fish shell](https://fishshell.com/) - 🐠 build in vim mode, not posix compatible though..
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
- [fzf](https://github.com/PatrickF1/fzf.fish) - Interactive filtering
- [yazi](https://github.com/sxyazi/yazi) - terminal file manager

## Requirements

Git and GNU stow are required to use these dotfiles.

## Installation

Check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com:yxian9/dotfile.git
cd dotfile
```

Then use GNU stow to create symlinks

```bash
stow -t ~/ .

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```bash
## install brew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install  fd fzf uv jq \
              git-delta \
              zoxide \
              yazi \
              fish \
              bat ripgrep \
              neovim 
# 

# mac specific
brew install wget tree tmux stow \
            jesseduffield/lazygit/lazygit \
              deno node go

defaults write $(osascript -e 'id of app "Cursor"') ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# image preview support
brew install poppler imagemagick ghostscript

brew install --cask nikitabobko/tap/aerospace
brew install --cask font-victor-mono-nerd-font
# brew install --cask font-jetbrains-mono-nerd-font
brew install --cask kitty
brew install --cask fork
brew install --cask r 


## addition application
brew install --cask logi-options+ #for K860 keyboard
brew install --cask time-out
brew install --cask google-chrome
brew install --cask bitwarden
brew install --cask pdfsam-basic # merge pdf files
brew install --cask iina
brew install --cask cyberduck
brew install --cask visual-studio-code
brew install --cask spotify
brew install --cask slack
brew install --cask karabiner-elements # keyboard modify

## fisher setup
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish


# java

# brew install --cask temurin ## JDK https://adoptium.net/ 

brew install openjdk
# For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# openjdk is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides similar software and installing this software in
# parallel can cause all kinds of trouble.
#
# If you need to have openjdk first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> $HOME/.bash_profile
#
# For compilers to find openjdk you may need to set:
#   export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

```

```bash
## git related setting

# per project lazygit setting https://github.com/jesseduffield/lazygit/pull/3787
touch .git/lazygit.yml

services:
  'github.foo.bar': 'github:github.foo.bar'

git update-index --skip-worktree file

# create .gitconfig-work/person file with info

```

MacOS setting:

Turn on

- "Keyboard navigation" in keyboard shortcuts.
- "Group windows by application"

Turn off

- "Displays have separate Spaces"

Language related tools

```bash
go install golang.org/x/tools/gopls@latest
uv python install 3.12
uv tool install ruff pyright

```

```bash
## setup ec2 env
AMAZON linux setup
sudo yum groupinstall "Development Tools"

<https://gist.github.com/alsunseri/dbd4d9d2fee5b59a8325ecd025d3c723>

## install brew on ec2 to manage developer tools

# ! /usr/bin/bash

THE_DEV_USERNAME=ec2-user

mkdir -p /home/linuxbrew/
chown $THE_DEV_USERNAME: /home/linuxbrew/

sudo -u $THE_DEV_USERNAME bash <<EOF
mkdir /home/linuxbrew/.linuxbrew/
git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew
mkdir /home/linuxbrew/.linuxbrew/bin/
ln -s /home/linuxbrew/.linuxbrew/Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
EOF
```
