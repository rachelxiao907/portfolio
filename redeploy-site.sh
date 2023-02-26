#!/bin/bash

# Change to project directory
cd portfolio

# Update to latest git version
git fetch && git reset origin/main --hard

# Activate virtual environment and install dependencies
source portfolio/env/bin/activate
pip install -r portfolio/requirements.txt

# Restart myportfolio service
systemctl restart myportfolio
