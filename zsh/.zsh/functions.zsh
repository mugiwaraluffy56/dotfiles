# ── rice: launch riced tmux session ───────────────
rice() {
  if [[ "$1" == "kill" ]]; then
    tmux kill-session -t rice 2>/dev/null && echo "rice session killed"
    return
  fi
  ~/.local/bin/rice "$@"
}

# ── tmux4: 4-pane layout ──────────────────────────
tmux4() {
  local session="${1:-tmux4}"
  tmux new-session -s "$session" \; \
    split-window -h \; \
    select-pane -L \; \
    split-window -v \; \
    select-pane -R \; \
    split-window -v
}
