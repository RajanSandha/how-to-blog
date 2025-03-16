#!/bin/bash
# deploy.sh - A script to simplify the process of deploying the blog to GitHub Pages
# Usage: ./deploy.sh ["Commit message"]

# Default commit message
COMMIT_MESSAGE=${1:-"Update blog content"}

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Error: git is not installed"
  exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
  echo "Error: Not in a git repository"
  exit 1
fi

# Check if Jekyll is installed
if ! command -v jekyll &> /dev/null; then
  echo "Error: Jekyll is not installed"
  echo "Please install it with: gem install jekyll bundler"
  exit 1
fi

echo "Starting deployment process..."

# Pull the latest changes
echo "Pulling latest changes from remote repository..."
git pull

# Build the site
echo "Building the site with Jekyll..."
JEKYLL_ENV=production bundle exec jekyll build

# Check if build was successful
if [ $? -ne 0 ]; then
  echo "Error: Jekyll build failed"
  exit 1
fi

# Add all changes
echo "Adding changes..."
git add .

# Commit changes
echo "Committing changes with message: $COMMIT_MESSAGE"
git commit -m "$COMMIT_MESSAGE"

# Push changes
echo "Pushing changes to remote repository..."
git push

echo "Deployment completed successfully!"
echo "Your site should be available at your GitHub Pages URL shortly." 