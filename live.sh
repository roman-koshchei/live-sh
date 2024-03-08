#!/bin/bash
# 
# GitHub:
# https://github.com/roman-koshchei/live-sh
# 
# live.sh is bash script to enable live reloading
# for any project and any language


# Directory sha
sha=0
previous_sha=0

# Running app process ID
previous_pid=-1

# Kill previous running app
kill_previous() {
  if [ $previous_pid -gt 0 ]; then
    kill "$previous_pid"
    previous_pid=-1
  fi
}

# Run project
# Change instructions for your situation
# Long running process should be run in background
# and terminated later
run() {
  gleam run &
  previous_pid=$!
  gleam format & 
}

while true; do
  sha=`ls -lR . | sha1sum`

  if [[ $sha != $previous_sha ]] ; then 
    kill_previous
    run
    previous_sha=$sha
  fi
  
  sleep 1
done

kill_previous