#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# Log output setup
exec > >(tee -i install_log.txt) 2>&1

echo "Starting installation script..."

# Check if Homebrew is installed, install if missing
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first !"
  exit 1
else
  echo "Homebrew is installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# List of packages to install, including stow
packages=(
  "ranger"
  "nvim"
  "eza"
  "stow" # Ensure GNU stow is installed
  "zoxide"
  "lazygit"
  "bat"
  "font-jetbrains-mono-nerd-font"
  "tmux"
  "neofetch"
  "fzf"
  "fd"
  "ripgrep"
  "imagemagick" #optional
  "awscli"
  "mysql"
  "go"
  "kitty"
  "spotify"
  "postman"
  "slack"
  "google-chrome"
  "obsidian"
  "docker"
  "rectangle"
  "mongodb-compass"
  "sequel-ace"
)

# Function to check if a package is already installed
is_installed() {
  brew list --formula "$1" &>/dev/null || brew list --cask "$1" &>/dev/null
}

# Install each package with logging, skip if already installed
for package in "${packages[@]}"; do
  if is_installed "$package"; then
    echo "✅ $package is already installed. Skipping."
  else
    echo "Installing $package..."
    if brew install "$package"; then
      echo "✅ Successfully installed $package"
    else
      echo "❌ Failed to install $package" >&2
      exit 1 # Exit if installation fails
    fi
  fi
done

# Backup .config directory
backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
if [ -d "$HOME/.config" ]; then
  echo "Backing up existing .config directory to $backup_dir"
  mv "$HOME/.config" "$backup_dir"
fi

# Backup .zshrc file if it exists
zshrc_backup="$HOME/.zshrc_backup_$(date +%Y%m%d_%H%M%S)"
if [ -f "$HOME/.zshrc" ]; then
  echo "Backing up existing .zshrc file to $zshrc_backup"
  mv "$HOME/.zshrc" "$zshrc_backup"
fi

# Clone dotfiles repo and set up symlinks with stow
echo "Cloning dotfiles repository and setting up symlinks with stow..."
cd ~
git clone git@github.com:anuragkumar2921/dotfiles.git || {
  echo "Dotfiles repository already exists. Skipping clone."
}
cd dotfiles

# Using GNU stow to create symlinks
stow .

# Clone tmux plugin manager (tpm) if it doesn’t already exist
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Cloning tmux plugin manager (tpm)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager (tpm) is already installed."
fi

# Cleanup Homebrew cache
echo "Cleaning up Homebrew cache..."
brew cleanup

echo "All installations and configurations completed successfully!"
