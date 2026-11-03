#!/bin/bash

# Simple push script for A.R.A.I
echo "🚀 A.R.A.I - Simple GitHub Push"
echo "==============================="
echo ""

# Ask for GitHub username
echo "Enter your GitHub username (David-Ajay):"
read GITHUB_USERNAME

# Ask for GitHub token
echo "Enter your GitHub Personal Access Token:"
read -s GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Error: Username and token are required"
    exit 1
fi

echo "📝 Configuring git remote..."
git remote set-url origin https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/David-Ajay/A.R.A.I.git

echo "📦 Staging changes..."
git add .

echo "💾 Committing changes..."
git commit -m "Rebranded to Smart AI Route and Itinerary Assistant (A.R.A.I) with updated UI screenshots and documentation" || echo "No new changes to commit"

echo "⬆️  Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 View your repository at: https://github.com/David-Ajay/A.R.A.I"
    
    # Clean up credentials
    echo ""
    echo "🔒 Cleaning up credentials..."
    git remote set-url origin https://github.com/David-Ajay/A.R.A.I.git
    echo "✅ Done!"
else
    echo ""
    echo "❌ Push failed. Please check the error messages above."
    # Clean up credentials anyway
    git remote set-url origin https://github.com/David-Ajay/A.R.A.I.git
    exit 1
fi
