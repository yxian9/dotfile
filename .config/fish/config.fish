switch (uname)
  case Darwin ## for macos
    eval (/opt/homebrew/bin/brew shellenv)
    fish_add_path /opt/homebrew/Caskroom/miniforge/base/condabin
    abbr bic "brew install --cask"
    abbr bin "brew info"
    abbr binc "brew info --cask"
    abbr bs "brew search"
    abbr zcat 'gzcat'

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


  case Linux
   # >>> conda initialize >>>
   # !! Contents within this block are managed by 'conda init' !!
    if test -f ~/miniconda3/bin/conda
        eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    else
        if test -f "~/miniconda3/etc/fish/conf.d/conda.fish"
            . "~/miniconda3/etc/fish/conf.d/conda.fish"
        else
            set -x PATH "~/miniconda3/bin" $PATH
        end
    end
    # <<< conda initialize <<<
    
end

## cursor
set fish_vi_force_cursor
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path ~/.config/bin
set -Ux EDITOR nvim
set -Ux OPENER nvim

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings


abbr vi "nvim"


starship init fish | source
zoxide init --cmd cd fish | source

bind \cr _fzf_search_history
bind \co _lfcd

bind -M insert \co _lfcd
bind -M insert \cr _fzf_search_history


