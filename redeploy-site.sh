#!/bin/bash

# Kill existing tmux sessions
tmux kill-session -a

# Update to latest git version
git fetch && git reset origin/main --hard

# Activate virtual environment and install dependencies
source env/bin/activate
pip install -r requirements.txt

# Start new detached tmux session
tmux new-session -d -s flask_server
tmux send-keys "cd portfolio" C-m
tmux send-keys "source env/bin/activate" C-m
tmux send-keys "flask run --host=0.0.0.0" C-m

echo "Flask server started"
