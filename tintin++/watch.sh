while [[ 1 ]]; do
  clear
  tail -q -n 100 --retry $1 2> /dev/null
  inotifywait -e modify -q --format "" $1
  sleep 0.05
done
