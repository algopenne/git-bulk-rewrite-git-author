#!/bin/bash

# === CONFIG ===
USERNAME="YOUR_NAME_HERE"  # replace this
CLONE_DIR="./"                   # same dir as script
# ==============

# Ensure authenticated
if ! gh auth status &>/dev/null; then
    echo "You must log in to GitHub CLI first. 
	If you are on Windows, you're going to get a MinTTY error. Use Powershell to run gh auth login first before running this script."
    gh auth login
    echo "Waiting for authentication to complete..."
    until gh auth status &>/dev/null; do sleep 1; done
fi

mkdir -p "$CLONE_DIR"
cd "$CLONE_DIR" || exit 1

gh repo list "$USERNAME" --limit 4000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done


echo ""
echo "🎉 All repositories processed."
