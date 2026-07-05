# Add brew and brew-installed program to path
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
  if not set -q TMUX
    sesh connect "🏠 Home"
  end
end

# Custom Alias
alias ls='lsd'
alias l='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias v='nvim'
alias n='nvim'
alias vdiff='nvim -d'
alias dps='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Networks}}\t{{.State}}\t{{.CreatedAt}}"'
alias t='tmux'
alias tn='tmux new-session -A -n'
alias ai='claude --dangerously-skip-permissions'
alias ccd='cd /Users/qcormand/Developer/ && cd'
alias p='pnpm'


set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx ZIG_HOME "$HOME/.zig"
set -gx PATH "$ZIG_HOME" $PATH
set -gx PKG_CONFIG_PATH "/opt/homebrew/lib/pkgconfig:/usr/local/lib/pkgconfig" $PKG_CONFIG_PATH

starship init fish | source

fish_add_path -a /Users/qcormand/.foundry/bin

# pnpm
set -gx PNPM_HOME "/Users/qcormand/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx PATH "/Users/qcormand/.local/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Tomorro
set -gx GITHUB_TOKEN "YOUR_GITHUB_TOKEN"
set -gx LOKALISE_TOKEN "YOUR_LOKALISE_TOKEN"
set -gx LOKALISE_PROJECT_APP_ID "YOUR_LOKALISE_PROJECT_APP_ID"
set -gx LOKALISE_PROJECT_API_ID "YOUR_LOKALISE_PROJECT_API_ID"

# AI Api Keys
# set -gx ANTHROPIC_API_KEY "YOUR_ANTHROPIC_API_KEY"
set -gx OPENAI_API_KEY "YOUR_OPENAI_API_KEY"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

zoxide init fish | source

function sesh-popup
  sesh connect "$(sesh list -c --icons | fzf-tmux -p 80%,70% \
    --no-sort --ansi \
    --border-label ' sesh ' \
    --prompt '⚡  ' \
    --header '  ^g configs  ^t tmux  ^x zoxide  ^a all' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-g:change-prompt(⚙ configs )+reload(sesh list -c --icons)' \
    --bind 'ctrl-t:change-prompt( tmux )+reload(sesh list -t --icons)' \
    --bind 'ctrl-x:change-prompt( zoxide )+reload(sesh list -z --icons)' \
    --bind 'ctrl-a:change-prompt(★ all )+reload(sesh list --icons)' \
    --preview 'sesh preview {}' \
    --preview-window 'right:55%')"
end
