# Enable Powerlevel10k instant prompt. Must stay at top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load secrets (not committed)
[[ -f ~/.secrets ]] && source ~/.secrets

# Guard: never leak OpenRouter key as OPENAI_API_KEY
if [[ "$OPENAI_API_KEY" == sk-or-v1-* ]]; then unset OPENAI_API_KEY; fi
if [[ "$OPENAI_API_BASE" == "https://openrouter.ai/api/v1" ]]; then unset OPENAI_API_BASE; fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# ── zsh-syntax-highlighting — Crimson palette ─────
ZSH_HIGHLIGHT_STYLES[command]='fg=33,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=39,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=27,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=39,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=33,italic'
ZSH_HIGHLIGHT_STYLES[path]='fg=255'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=160'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=160'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=160'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=160'
ZSH_HIGHLIGHT_STYLES[assign]='fg=27'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=33'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=124'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=160'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=27,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=242'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=33,bold'

# PATH
export PATH="/usr/local/mysql/bin:$PATH"
export GITPERLLIB=/opt/homebrew/share/perl5:$HOME/perl5/lib/perl5:/opt/homebrew/Cellar/git/2.52.0/share/perl5
export PATH="/Users/puneethadityamyakam/.antigravity/antigravity/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export BAT_THEME="base16"
export EDITOR='nvim'

# Local bin
. "$HOME/.local/bin/env"

# Load partials
for f in ~/.zsh/*.zsh; do source "$f"; done

# Completions
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Fastfetch on new interactive non-tmux shell
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then fastfetch; fi

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
