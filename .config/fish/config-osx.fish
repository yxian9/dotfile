eval (/opt/homebrew/bin/brew shellenv)
fish_add_path -a /opt/homebrew/bin/ /opt/homebrew/opt/curl/bin
fish_add_path -a ~/.pixi/bin
fish_add_path -a /opt/homebrew/opt/openjdk/bin

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
