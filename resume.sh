#!/bin/bash
 
# Resumes the main or 0 tmux session
 
SESSION_NAME=$1
if [ -z "$SESSION_NAME" ]; then
    SESSION_NAME='^main|^0}'
fi
 
ACTIVE_SESSION=$(tmux ls | grep -Ei "$SESSION_NAME" | cut -d':' -f 1)
 
if [ -z "$ACTIVE_SESSION" ]; then
        echo "Failed to find active session"
        read -p "Would you like to start a new main session? [y/n] " -n 1 -r
        # Newline
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            tmux new-session -t main
        fi
        exit 1
fi
 
tmux attach -t "$ACTIVE_SESSION"