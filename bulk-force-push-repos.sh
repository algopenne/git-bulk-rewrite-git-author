#!/bin/bash

for dir in */; do
    if [ -d "$dir/.git" ]; then
        echo "Pushing $dir..."
        git -C "$dir" push -u origin --force "$(git -C "$dir" rev-parse --abbrev-ref HEAD)"
    else
        echo "Skipping $dir (not a Git repo)"
    fi
done

echo ""
echo "🎉 All repositories processed."

read -p "Press Enter to close..."
