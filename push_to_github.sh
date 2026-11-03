#!/bin/bash

# Script to push A.R.A.I project to GitHub
# Make sure to save screenshots before running!

echo "🚀 A.R.A.I - GitHub Push Script"
echo "================================"
echo ""

# Check if screenshots exist
if [ ! -f "docs/screenshots/welcome-screen.png" ] || \
   [ ! -f "docs/screenshots/itinerary-overview.png" ] || \
   [ ! -f "docs/screenshots/budget-breakdown.png" ]; then
    echo "⚠️  WARNING: Screenshots not found!"
    echo "Please save your screenshots to docs/screenshots/ before continuing:"
    echo "  - welcome-screen.png"
    echo "  - itinerary-overview.png"
    echo "  - budget-breakdown.png"
    echo ""
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
fi

# Ask for GitHub token
echo "Enter your GitHub Personal Access Token:"
read -s GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Error: Token cannot be empty"
    exit 1
fi

echo "📝 Configuring git remote..."
git remote set-url origin https://${GITHUB_TOKEN}@github.com/David-Ajay/A.R.A.I.git

echo "📦 Staging changes..."
git add README.md
git add .gitignore
git add docs/screenshots/
git add frontend/
git add backend/
git add tests/
git add requirements.txt
git add *.md
git add *.sh
git add .env.example

echo "💾 Committing changes..."
git commit -m "Rebranded to Smart AI Route and Itinerary Assistant (A.R.A.I) with updated UI screenshots and documentation"

echo "🔄 Checking remote status..."
git fetch origin

# Check if we need to pull first
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")

if [ $LOCAL != $REMOTE ]; then
    echo "⚠️  Remote has changes. Pulling first..."
    git pull origin main --rebase
fi

echo "⬆️  Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 View your repository at: https://github.com/David-Ajay/A.R.A.I"
    
    # Clean up credentials from remote URL
    echo ""
    echo "🔒 Cleaning up credentials from remote URL..."
    git remote set-url origin https://github.com/David-Ajay/A.R.A.I.git
    echo "✅ Done!"
else
    echo ""
    echo "❌ Push failed. Please check the error messages above."
    exit 1
fi
