# Git Automation Script for Windows PowerShell
# Stops execution if any command fails
$ErrorActionPreference = "Stop"

Write-Host "------ Git Automation Script (Windows) ------"

# Ask for GitHub repo URL
$repoUrl = Read-Host "Enter GitHub Repository URL (HTTPS)"

# Ask for commit message
$commitMsg = Read-Host "Enter commit message"

Write-Host "Initializing local git repository..."
git init

Write-Host "Adding all project files..."
git add .

Write-Host "Committing files..."
git commit -m "$commitMsg"

Write-Host "Setting branch to main..."
git branch -M main

Write-Host "Adding remote origin..."
git remote add origin $repoUrl

Write-Host "Pulling latest from GitHub (rebase)..."
try {
    git pull origin main --rebase
} catch {
    Write-Host "No remote files to pull or rebase failed."
}

Write-Host "Pushing code to GitHub..."
git push -u origin main

Write-Host "------ DONE ------"
Write-Host "Your project is successfully pushed to GitHub!"
