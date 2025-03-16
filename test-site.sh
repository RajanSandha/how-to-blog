#!/bin/bash
# test-site.sh - A script to test the Jekyll site locally before deployment
# Usage: ./test-site.sh

# Check if Jekyll is installed
if ! command -v jekyll &> /dev/null; then
  echo "Error: Jekyll is not installed"
  echo "Please install it with: gem install jekyll bundler"
  exit 1
fi

echo "==== Starting Jekyll site testing ===="

# Clean any previous build
echo "Cleaning previous build..."
rm -rf _site .jekyll-cache

# Process environment variables
echo "Processing environment variables..."
ruby process_env.rb

# Build the site
echo "Building site in production mode..."
JEKYLL_ENV=production bundle exec jekyll build

# Check if build was successful
if [ $? -ne 0 ]; then
  echo "Error: Jekyll build failed"
  exit 1
fi

# Verify essential files exist
echo "Verifying essential files..."
MISSING_FILES=0

# Check for index.html
if [ ! -f "_site/index.html" ]; then
  echo "Error: index.html is missing from the _site directory"
  MISSING_FILES=1
fi

# Check for 404.html
if [ ! -f "_site/404.html" ]; then
  echo "Error: 404.html is missing from the _site directory"
  MISSING_FILES=1
fi

# Check for CSS files
if [ ! -d "_site/assets/css" ] || [ -z "$(ls -A _site/assets/css/)" ]; then
  echo "Error: CSS files are missing from the _site/assets/css directory"
  MISSING_FILES=1
else
  echo "Found CSS files:"
  ls -la _site/assets/css/
fi

if [ $MISSING_FILES -eq 1 ]; then
  echo "Error: Some essential files are missing. Fix the issues before deploying."
  exit 1
fi

# Serve the site locally
echo "Starting local server to test the site..."
echo "Site will be available at http://localhost:4000/"
echo "Press Ctrl+C to stop the server"
JEKYLL_ENV=production bundle exec jekyll serve 