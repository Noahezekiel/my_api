#!/usr/bin/env bash
set -o errexit  # Stop if any error happens

bundle exec rails db:migrate  # Apply database changes
