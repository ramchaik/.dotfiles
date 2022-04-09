# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"

plugins=(
  brew
  git
  node
  npm 
  nvm
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
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"

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

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# manually setting Lang
export LANG=en_US.UTF-8

source "/Users/ramchaik/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
