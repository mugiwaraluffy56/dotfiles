#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install stow
brew bundle install --file="$DOTFILES_DIR/Brewfile"

cd "$DOTFILES_DIR"
stow zsh git tmux ssh nvim

# Go tools
if command -v go &>/dev/null; then
  go install golang.org/x/tools/gopls@latest
  go install golang.org/x/tools/cmd/goimports@latest
  go install mvdan.cc/gofumpt@latest
  go install github.com/fatih/gomodifytags@latest
  go install github.com/josharian/impl@latest
  go install github.com/go-delve/delve/cmd/dlv@latest
fi

# Rust tools (rust-analyzer via rustup)
if command -v rustup &>/dev/null; then
  rustup component add rust-analyzer clippy rustfmt
fi

cat <<'EOF'

Done. Next steps:
  1. cp ~/.secrets.example ~/.secrets  (and fill in your keys)
  2. Open a new shell
  3. Run nvim — LazyVim installs all plugins on first launch

EOF
