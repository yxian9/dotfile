# My dotfiles

This directory contains the dotfiles for my system macOS and Linux

- [lazyVim](https://www.lazyvim.org/) - 💤 neovim distribution 
- [lazygit](https://github.com/jesseduffield/lazygit) -  💤 terminal UI for git 
- [kitty](https://github.com/kovidgoyal/kitty) - 🐱 a terminal that support true color and image protocol
- [fish shell](https://fishshell.com/) - 🐠 build in vim mode, not posix compatiable though..
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
- [fzf](https://github.com/PatrickF1/fzf.fish) - Interactive filtering
- [yazi](https://github.com/sxyazi/yazi) - terminal file manager

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
$ stow -t ~/ .
```

brew install
```
brew install wget fd fzf uv jq \
              jesseduffield/lazygit/lazygit \
              git-delta \
              zoxide \
              yazi \
              fish \
              bat ripgrep \
              neovim \
              tmux stow \
              deno node

brew install --cask nikitabobko/tap/aerospace
brew install --cask font-victor-mono-nerd-font
# brew install --cask font-jetbrains-mono-nerd-font
brew install --cask kitty
brew install --cask fork


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
brew install --cask temurin ## JDK https://adoptium.net/ 
brew install --cask karabiner-elements # keyboard modify

## fisher setup
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish

# ignore some local setting files
# git update-index --skip-worktree file
```
macOS setting:

turn on
- "Keyboard navigation" in keyboard shortcuts.
- "Group windows by application"

turn off
- "Displays have separate Spaces"

lsp related stuff
```
go install golang.org/x/tools/gopls@latest
uv python install 3.12
uv tool install ruff pyright

```
