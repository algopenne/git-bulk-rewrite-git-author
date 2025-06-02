#!/bin/bash

# Config
SEARCH_NAME="YOUR_NAME_HERE"  # Replace with the name you're searching for
ROOT_DIR="."  # Change if needed

echo "Searching for commits by: $SEARCH_NAME"

find "$ROOT_DIR" -type d -name ".git" | while read gitdir; do
    REPO_DIR=$(dirname "$gitdir")
    cd "$REPO_DIR" || continue

    MATCHES=$(git log --all --pretty=format:"%an <%ae>" | grep -F "$SEARCH_NAME" | sort | uniq)

    if [[ -n "$MATCHES" ]]; then
        echo "Found in: $REPO_DIR"
        echo "$MATCHES"
    else
        echo "Not found in: $REPO_DIR"
    fi

    cd - > /dev/null
done

echo ""
echo "🎉 All repositories processed."

read -p "Press Enter to close..."
