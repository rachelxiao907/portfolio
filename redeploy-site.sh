#!/bin/bash

# Change to project directory
cd portfolio

# Update to latest git version
git fetch && git reset origin/main --hard

# Spin containers down to prevent out of memory issues on our VPS instances
docker compose -f docker-compose.prod.yml down

docker compose -f docker-compose.prod.yml up -d --build
