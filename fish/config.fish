# ===== 1. INTERACTIVE SESSION SETTINGS =====
if status is-interactive
    # System information display
    if type -q neofetch
        neofetch
    else if type -q fastfetch
        fastfetch
    end
end

# ===== 2. SHELL BEHAVIOR =====
# Vi mode keybindings
fish_vi_key_bindings

# History settings
set -g fish_history_file ~/.cache/fish/history
mkdir -p ~/.cache/fish
touch ~/.cache/fish/history

# Language settings
set -gx LANG en_US.UTF-8

# ===== 3. KEYBINDINGS =====
# Escape insert mode with 'jk'
bind -M insert -m default jk backward-char force-repaint

# Key binding for tmux-sessionizer
function fish_user_key_bindings
    # This ensures the binding works in Vi mode
    bind \cf tmux-sessionizer
end

# ===== 4. FZF CONFIGURATION =====
if functions -q fzf_configure_bindings
    fzf_configure_bindings
end

set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS --ansi

# ===== 5. THEME =====
if functions -q theme_gruvbox
    theme_gruvbox dark hard
end

# ===== 6. PATH MANAGEMENT =====
# Local bin
if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

# Go environment
set -gx GOPATH $HOME/golang
set -gx GOROOT /opt/homebrew/opt/go/libexec
fish_add_path $GOPATH/bin $GOROOT/bin

# PNPM
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# Android SDK
set -gx ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools

# TeX path
fish_add_path /Library/TeX/texbin

# ===== 7. ALIASES =====
# General aliases
alias c="clear"
alias v="nvim"
alias d="podman"
alias lg="lazygit"
alias ldo="lazydocker"
alias mkdir="mkdir -p"
alias ip="ipconfig getifaddr en0"
alias python="python3"
alias pip="pip3"

# Tmux aliases
alias ts="tmux-sessionizer"
alias ta="tmux a"
alias tks="tmux kill-server"

# Git aliases
alias git="hub"
alias s="git status -sb"

# AWS aliases
alias awsp="aws --profile=personal"

# ===== 8. ENVIRONMENT VARIABLES =====
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# AWS settings
set -gx AWS_PROFILE personal

# ===== 9. TOOL INTEGRATIONS =====
# Starship prompt
if type -q starship
    starship init fish | source
end

# Node version manager
if type -q fnm
    fnm env --use-on-cd | source
end

# Thefuck alias
if type -q thefuck
    thefuck --alias | source
end

# Zoxide for directory navigation
if type -q zoxide
    zoxide init fish | source
end

# ===== 10. CONDA INITIALIZATION =====
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        source "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -gx PATH /opt/anaconda3/bin $PATH
    end
end

# ===== 11. OTHER TOOL CONFIGURATIONS =====
# SDKMAN initialization
if test -f "$HOME/.sdkman/bin/sdkman-init.fish"
    source "$HOME/.sdkman/bin/sdkman-init.fish"
end

# Mise activation
if type -q mise
    mise activate fish | source
end

# Deno environment
if test -f "$HOME/.deno/env.fish"
    source "$HOME/.deno/env.fish"
end
