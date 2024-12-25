switch (uname)
    case Darwin ## for macos
        eval (/opt/homebrew/bin/brew shellenv)
        fish_add_path -a /opt/homebrew/bin/
        fish_add_path -a /opt/homebrew/Caskroom/miniforge/base/condabin
        fish_add_path /opt/homebrew/opt/curl/bin
        fish_add_path -a ~/.local/bin
        fish_add_path ~/.config/bin
        fish_add_path /usr/local/go/bin
        fish_add_path ~/go/bin
        abbr bic "brew install --cask"
        abbr vm "NVIM_APPNAME=nvim_manual_config nvim"
        abbr l "NVIM_APPNAME=lazy nvim"
        abbr bin "brew info"
        abbr binc "brew info --cask"
        abbr bs "brew search"
        abbr zcat gzcat
        set -x HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
            eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" hook $argv | source
        else
            if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
                . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
            else
                fish_add_path -a /opt/homebrew/Caskroom/miniforge/base/bin
            end
        end
        # <<< conda initialize <<< 

    case Linux
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        if test -f ~/miniconda3/bin/conda
            eval ~/miniconda3/bin/conda "shell.fish" hook $argv | source
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
# set fish_vi_force_cursor
# set fish_cursor_default block

# Set the insert mode cursor to a line
set fish_cursor_insert line

# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here

# set fish_cursor_visual block

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x XDG_CONFIG_HOME $HOME/.config
set -Ux EDITOR nvim
set -Ux OPENER nvim

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings


abbr v nvim
abbr g lazygit
abbr rm "rm -i"
abbr m spotify_player
abbr s "kitten ssh"
abbr lc "nvim leetcode.nvim"


# starship init fish | source
zoxide init --cmd cd fish | source

bind \cr _fzf_search_history
bind \co _lfcd

bind -M insert \co _lfcd
bind -M insert \cr _fzf_search_history

set -g fish_escape_delay_ms 30

## git promt
# set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_hide_untrackedfiles 1
#
# set -g __fish_git_prompt_color_branch magenta
# set -g __fish_git_prompt_showupstream informative
# set -g __fish_git_prompt_char_upstream_ahead "↑"
# set -g __fish_git_prompt_char_upstream_behind "↓"
# set -g __fish_git_prompt_char_upstream_prefix ""
#
# set -g __fish_git_prompt_char_stagedstate "●"
# set -g __fish_git_prompt_char_dirtystate "+"
# set -g __fish_git_prompt_char_untrackedfiles "…"
# set -g __fish_git_prompt_char_conflictedstate "✖"
# set -g __fish_git_prompt_char_cleanstate "✔"
#
# set -g __fish_git_prompt_color_dirtystate blue
# set -g __fish_git_prompt_color_stagedstate yellow
# set -g __fish_git_prompt_color_invalidstate red
# set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
# set -g __fish_git_prompt_color_cleanstate green


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
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
