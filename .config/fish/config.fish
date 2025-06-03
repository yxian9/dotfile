# Setup brew
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
end

fish_add_path -a ~/.local/bin
fish_add_path -a ~/.config/bin ~/go/bin

abbr bic "brew install --cask"
abbr vm "NVIM_APPNAME=nvim_manual_config nvim"
abbr bin "brew info"
abbr binc "brew info --cask"
abbr bs "brew search"
abbr zcat gzcat
abbr ok okta-awscli

set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x MANPAGER "nvim -c '+Man!' -"
## cursor
# set fish_vi_force_cursor
# set fish_cursor_default block

# Set the replace mode cursors to an underscore
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x XDG_CONFIG_HOME $HOME/.config
set -Ux EDITOR nvim
set -Ux OPENER nvim

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

abbr v nvim
abbr dr "deno -A solve.ts"
abbr dt "deno test -A slove_test.ts"
abbr g lazygit
abbr rm "rm -i"
abbr m spotify_player
abbr s "kitten ssh"
abbr lc "nvim leetcode.nvim"

zoxide init --cmd cd fish | source

bind \cr _fzf_search_history

bind -M insert \cr _fzf_search_history

# for insert mode: accept autosuggestion
bind -M insert \cf forward-char
# for "normal" mode
bind -M default \cf forward-char
bind -M visual y fish_clipboard_copy
bind -M default yy fish_clipboard_copy
bind -M default p fish_clipboard_paste
set -g fish_escape_delay_ms 30

## fzf cd
function fcd
    # Get a list of directories, ignore errors
    set curDirs (ls -d */ 2>/dev/null )

    # Exit if no directories are found
    if test -z "$curDirs"
        return
    end

    # Use fzf to allow the user to select a directory
    set SELECTED_curDirs (echo $curDirs | string split " " | string trim -r -c '/' | fzf --cycle --layout=reverse --border \
      --height=90% --preview-window=wrap --marker="*" --prompt='Select dir: ')

    # Exit if no directory is selected
    if test -z "$SELECTED_curDirs"
        return
    end

    # Remove the trailing slash to prevent issues
    set SELECTED_curDirs (string trim -r -c '/' "$SELECTED_curDirs")

    # Change to the selected directory and show current directory
    cd $SELECTED_curDirs && return
end

## fish shell cursor
# https://github.com/fish-shell/fish-shell/issues/7458
function fish_mode_prompt
    switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
            set_color -o brwhite
            echo "["
            set_color -o brred
            echo N
            set_color -o brwhite
            echo "]"
        case insert
            echo -en "\e[6 q"
            set_color -o brwhite
            echo "["
            set_color -o brgreen
            echo I
            set_color -o brwhite
            echo "]"
        case replace_one
            echo -en "\e[4 q"
            set_color -o brwhite
            echo "["
            set_color -o bryellow
            echo R
            set_color -o brwhite
            echo "]"
        case visual
            echo -en "\e[2 q"
            set_color -o brwhite
            echo "["
            set_color -o brmagenta
            echo V
            set_color -o brwhite
            echo "]"
        case '*'
            echo -en "\e[2 q"
            set_color -o brwhite
            echo "["
            set_color -o brred
            echo "?"
            set_color -o brwhite
            echo "]"
    end
    set_color normal
end

## yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

uv generate-shell-completion fish | source
direnv hook fish | source
