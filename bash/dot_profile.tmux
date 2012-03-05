if [[ -z "$TMUX" ]] && [[ -x `which tmux 2> /dev/null` ]]; then
  session_base=lori

  ### Find stale sessions and let them die
  old_sessions=$(tmux ls 2>/dev/null | egrep "^[0-9]{14}.*[0-9]+\)$" | cut -f 1 -d:)
  for old_session_id in $old_sessions; do
    tmux kill-session -t $old_session_id
  done

  ### Kick off the base session if none are present
  declare base_started=0
  tmux has-session -t $session_base 
  if [[ $? -eq 1 ]]; then
    tmux new-session -d -s $session_base
    base_started=1
  fi

  ### Launch our new child session
  session_id="$(date +%Y%m%d%H%M%S)$$"
  tmux new-session -d -t $session_base -s $session_id
  # Don't open a new window if we are the first child session
  [[ $base_started = 0 ]] && tmux new-window -t $session_id
  tmux attach-session -t $session_id
  tmux kill-session -t $session_id
  exit
fi
