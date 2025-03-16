#!/bin/bash
# sync.sh - A script to simplify the process of syncing content with GitHub
# Usage: ./sync.sh "Commit message"

# Check if a commit message was provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a commit message"
  echo "Usage: ./sync.sh \"Commit message\""
  exit 1
fi

# Store the commit message
COMMIT_MESSAGE="$1"

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

# Pull the latest changes
echo "Pulling latest changes from remote repository..."
git pull

# Check for changes
if git diff --quiet && git diff --staged --quiet; then
  echo "No changes to commit"
else
  # Add all changes
  echo "Adding changes..."
  git add .

  # Commit changes
  echo "Committing changes with message: $COMMIT_MESSAGE"
  git commit -m "$COMMIT_MESSAGE"

  # Push changes
  echo "Pushing changes to remote repository..."
  git push

  echo "Sync completed successfully!"
fi 