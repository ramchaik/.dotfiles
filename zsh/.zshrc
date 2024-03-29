# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ZSH=$HOME/.oh-my-zsh

plugins=(
  brew
  git
  node
  nvm
  npm 
  docker
  docker-compose
  zsh-vi-mode
  # -- add plugins above this line --
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [[ -z $DOTFILES ]]; then
    export DOTFILES=$HOME/.dotfiles
fi

# -------------------------
# Source Plugins
# -------------------------
# plugin: [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_INIT_MODE=sourcing
  # Only changing the escape key to `jk` in insert mode, we still
  # keep using the default keybindings `^[` in other modes
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # Change to Zsh's default readkey engine
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
}
# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  export FZF_DEFAULT_COMMAND='fd --type file  --color=always --follow --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"

  # Use vim keys in tab complete menu:
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
  bindkey -M menuselect 'j' vi-down-line-or-history
  bindkey -v '^?' backward-delete-char

  # tmux sessionizer
  bindkey -s ^f "tmux-sessionizer\n"
}

# Source --------end------------- 

# Source OMZ 
source $ZSH/oh-my-zsh.sh

## stdout 
neofetch

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
[ ! -f ~/.cache/zsh/history ] && touch ~/.cache/zsh/history
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

export PATH="/usr/local/sbin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# manually setting Lang
export LANG=en_US.UTF-8

lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

tere() {
    local result=$(/Users/ramchaik/.cargo/bin/tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
