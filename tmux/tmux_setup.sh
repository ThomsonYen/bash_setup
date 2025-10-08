tmux() {
  if [[ $# -eq 0 ]]; then
    command tmux new-session zsh
  else
    command tmux "$@"
  fi
}
