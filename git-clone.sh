
#!/bin/bash
echo "🛠 Setting up GitHub SSH access..."

# Generate SSH key
ssh-keygen -t ed25519 -C "intern@ukubona.ai" -f ~/.ssh/id_ed25519 -N ""

# Start SSH agent
eval "$(ssh-agent -s)"
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub
echo "🔑 SSH key copied to clipboard."

# Prompt intern to add to GitHub
echo "👉 Visit https://github.com/settings/keys and paste the key."
read -p "Press [Enter] once you've added the key to GitHub..."

# Test the connection
ssh -T git@github.com

# Clone the repo
git clone git@github.com:abikesa/ukubona.git

echo "✅ Done. You are now ready to code. No more prompts."
