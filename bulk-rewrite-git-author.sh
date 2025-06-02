#!/bin/bash

# Configuration
OLD_EMAILS=("oldemail1@domain.com" "oldemail2@domain.com") 
NEW_NAME="NEW_NAME_HERE"
NEW_EMAIL="newemail@domain.com"

# Root folder with your repos (default is current directory)
ROOT_DIR="."

echo "🔍 Searching for git repos in: $ROOT_DIR"
find "$ROOT_DIR" -type d -name ".git" | while read gitdir; do
    REPO_DIR=$(dirname "$gitdir")
    echo "📁 Processing repo: $REPO_DIR"
    
    cd "$REPO_DIR" || continue

    REMOTE_URL=$(git remote get-url origin 2>/dev/null)

    OLD_EMAIL_CHECKS=""
    for email in "${OLD_EMAILS[@]}"; do
        OLD_EMAIL_CHECKS+="
if commit.committer_email == b\"$email\":
    commit.committer_name = b\"$NEW_NAME\"
    commit.committer_email = b\"$NEW_EMAIL\"
    changed = True
if commit.author_email == b\"$email\":
    commit.author_name = b\"$NEW_NAME\"
    commit.author_email = b\"$NEW_EMAIL\"
    changed = True
"
    done

    git filter-repo --force --commit-callback "
changed = False
$OLD_EMAIL_CHECKS
if changed:
    print(f'Changed commit {commit.original_id.decode()}')
"

    if [ -n "$REMOTE_URL" ]; then
        git remote add origin "$REMOTE_URL"
        echo "🔁 Re-added remote: $REMOTE_URL"
    fi

    echo "Finished rewriting in: $REPO_DIR"
    cd - > /dev/null
done

echo ""
echo "🎉 All repositories processed."

read -p "Press Enter to close..."
