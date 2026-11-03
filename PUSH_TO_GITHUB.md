# Push to GitHub Guide

## Prerequisites
- You have a GitHub Personal Access Token (PAT)
- The repository exists at: https://github.com/David-Ajay/A.R.A.I

## Step-by-Step Commands

### 1. Save Your Screenshots (IMPORTANT - Do this first!)

Before running the commands below, you need to manually save the three screenshots you provided:

1. Save the first screenshot (Welcome Screen) as: `docs/screenshots/welcome-screen.png`
2. Save the second screenshot (Itinerary Overview) as: `docs/screenshots/itinerary-overview.png`
3. Save the third screenshot (Budget Breakdown) as: `docs/screenshots/budget-breakdown.png`

The `docs/screenshots` directory has already been created for you.

### 2. Configure Git with Your Token

```bash
cd /Users/david/Downloads/A.R.A.I

# Configure git to use your token (replace YOUR_GITHUB_TOKEN with your actual token)
git config credential.helper store
git remote set-url origin https://YOUR_GITHUB_TOKEN@github.com/David-Ajay/A.R.A.I.git
```

### 3. Stage All Changes

```bash
# Add all modified and new files
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
```

### 4. Commit Your Changes

```bash
git commit -m "Rebranded to Smart AI Route and Itinerary Assistant (A.R.A.I) with updated UI screenshots and documentation"
```

### 5. Push to GitHub

```bash
# Push to main branch
git push -u origin main
```

### 6. Verify Push

After pushing, visit: https://github.com/David-Ajay/A.R.A.I to verify everything is there.

## Alternative: Using GitHub CLI (if installed)

If you have GitHub CLI installed (`gh`), you can authenticate more easily:

```bash
cd /Users/david/Downloads/A.R.A.I
gh auth login
# Follow the prompts to authenticate

# Then push
git add .
git commit -m "Rebranded to Smart AI Route and Itinerary Assistant (A.R.A.I)"
git push -u origin main
```

## Troubleshooting

### If push is rejected:
```bash
# Pull first (if there are remote changes)
git pull origin main --rebase

# Then push again
git push -u origin main
```

### If you need to force push (use with caution):
```bash
git push -u origin main --force
```

### To see what will be pushed:
```bash
git status
git log origin/main..HEAD
```

## Security Note

After pushing successfully, you may want to remove the token from the remote URL:

```bash
git remote set-url origin https://github.com/David-Ajay/A.R.A.I.git
```

The credentials will still be stored locally in your credential helper if you configured it.
