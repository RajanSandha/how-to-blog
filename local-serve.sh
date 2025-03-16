#!/bin/bash
# local-serve.sh - A script to serve the blog locally for testing
# Usage: ./local-serve.sh

# Check if Jekyll is installed
if ! command -v jekyll &> /dev/null; then
  echo "Error: Jekyll is not installed"
  echo "Please install it with: gem install jekyll bundler"
  exit 1
fi

echo "Starting local Jekyll server..."

# Build and serve the site with baseurl set to empty for local development
JEKYLL_ENV=development bundle exec jekyll serve --baseurl="" --livereload

echo "Server stopped" 