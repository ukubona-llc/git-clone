#!/bin/bash
echo "🛠 Setting up GitHub SSH access..."
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
echo "🔑 SSH key copied to clipboard. Paste into GitHub: https://github.com/settings/keys"
