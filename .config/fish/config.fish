eval (/opt/homebrew/bin/brew shellenv)
if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path ~/.config/bin
fish_add_path /opt/homebrew/Caskroom/miniforge/base/condabin
set -Ux EDITOR nvim
set -Ux OPENER nvim

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings


abbr vi "nvim"
abbr bic "brew install --cask"
abbr bin "brew info"
abbr binc "brew info --cask"
abbr bs "brew search"

starship init fish | source
zoxide init --cmd cd fish| source

bind \cr _fzf_search_history
bind \co _lfcd

bind -M insert \co _lfcd
bind -M insert \cr _fzf_search_history


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniforge/base/bin" $PATH
    end
end
# <<< conda initialize <<<

