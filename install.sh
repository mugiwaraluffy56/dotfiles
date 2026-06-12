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
stow zsh git tmux ssh

cat <<'EOF'

Done. Next steps:
  1. cp ~/.secrets.example ~/.secrets  (and fill in your keys)
  2. Open a new shell

EOF
