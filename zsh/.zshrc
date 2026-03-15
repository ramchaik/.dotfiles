# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ── Zinit ────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ── OMZ plugin snippets ──
# gitfast: source git's native prompt script first
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
zinit snippet OMZP::gitfast
zinit snippet OMZP::aws
zinit snippet OMZP::brew
zinit snippet OMZP::docker
zinit snippet OMZP::encode64
zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::jsontools
zinit snippet OMZP::mvn
zinit snippet OMZP::node
zinit snippet OMZP::npm
zinit snippet OMZP::sudo
zinit snippet OMZP::urltools
zinit snippet OMZP::yarn

# ── Community plugins (turbo/async) ──
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# must be last
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# ── Vim mode (sync — must load after turbo plugins) ──────
function zvm_after_init() {
  source <(fzf --zsh)
  bindkey -s ^f "sessionizer\n"
  bindkey -s ^w "csw\n"
}
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# ── Completions ───────────────────────────────────────────
autoload -Uz compinit
compinit
source <(jj util completion zsh)

# ── Aliases & Functions ───────────────────────────────────
gcbj() {
    read "ticket?JIRA ticket: "
    read "desc?Description: "
    desc=$(echo "$desc" | tr " " "-")
    git checkout -b "$(git config user.github)/$ticket/$desc"
}

alias nx="yarn nx"
alias v="nvim"
alias c="claude"
alias cu="cursor"
alias ca="cursor-agent"
alias co="code"
alias oc="opencode"
cw() {
  local default_branch
  default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
  default_branch=${default_branch:-main}
  git fetch origin "$default_branch" && claude --worktree "$@"
}
alias lg="lazygit"
lgw() { cmux new-workspace && sleep 0.2 && cmux send "lazygit\n" }
btopw() { cmux new-workspace && sleep 0.2 && cmux send "btop\n" }
csw() {
  local selection
  selection=$(cmux list-workspaces 2>/dev/null \
    | sed 's/^\* /  /' \
    | sed 's/  \[selected\]//' \
    | fzf --prompt="workspace> " --ansi)
  [[ -z $selection ]] && return
  local ref
  ref=$(echo "$selection" | grep -o 'workspace:[0-9]*')
  [[ -n $ref ]] && cmux select-workspace --workspace "$ref"
}
alias ta="tmux attach"
alias nxr='cd $(git rev-parse --show-toplevel) && yarn nx'

# ── Environment ───────────────────────────────────────────
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NX
NX_TUI_AUTO_EXIT=true
NX_TUI=false

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# ── Faire (work) ──────────────────────────────────────────
# Private env vars (Cypress, ANTHROPIC_API_KEY, etc.) live in ~/.config/.faire
# Not committed — create locally and source it.
# Template entries:
#   export CYPRESS_*=...
#   export ANTHROPIC_API_KEY=...
[ -s "$HOME/.config/.faire" ] && source "$HOME/.config/.faire"

export JAVA_HOME="$(/usr/libexec/java_home -v 21)"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# for remote desktop - cursor mode
export VSCODE_BIN=/Applications/Cursor.app/Contents/Resources/app/bin/cursor
export EDITOR="nvim"

export SNOWSQL_USER="vaibhav.singh"
export MY_SNOWFLAKE_USER="vaibhav.singh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export DOCKER_HOST=unix://$HOME/.colima/docker.sock

## Faire
export FAIRE_WEB_SKIP_YARN_INSTALL=1

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# ── Starship (always last) ────────────────────────────────
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
