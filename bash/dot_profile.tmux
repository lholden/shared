if [[ -z "$TMUX" ]] && [[ -x `which tmux 2> /dev/null` ]]; then
  session_base=lori
  # Find stale sessions and let them die
  old_sessions=$(tmux ls 2>/dev/null | egrep "^[0-9]{14}.*[0-9]+\)$" | cut -f 1 -d:)
  for old_session_id in $old_sessions; do
    tmux kill-session -t $old_session_id
  done

  # Become our base session if we are the first ones here
  tmux has-session -t $session_base 
  if [[ $? -eq 1 ]]; then
    tmux new-session -s $session_base
  else
    session_id="$(date +%Y%m%d%H%M%S)$$"
    tmux new-session -d -t $session_base -s $session_id
    tmux new-window -t $session_id
    tmux attach-session -t $session_id
    tmux kill-session -t $session_id
  fi
  exit
fi
