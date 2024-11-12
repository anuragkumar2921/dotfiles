#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# Log output setup
exec > >(tee -i install_log.txt) 2>&1

echo "Starting installation script..."

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Check if Homebrew is installed, install if missing
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# List of packages to install, including stow
packages=(
  "kitty --cask"
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
    if brew install $package; then
      echo "✅ Successfully installed $package"
    else
      echo "❌ Failed to install $package" >&2
      exit 1 # Exit if installation fails
    fi
  fi
done

# Backup and create .config directory
backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
if [ -d "$HOME/.config" ]; then
  echo "Backing up existing .config directory to $backup_dir"
  mv "$HOME/.config" "$backup_dir"
fi
echo "Creating a new .config directory"
mkdir -p "$HOME/.config"

# Backup .zshrc file and create a new one if it doesn't exist
zshrc_backup="$HOME/.zshrc_backup_$(date +%Y%m%d_%H%M%S)"
if [ -f "$HOME/.zshrc" ]; then
  echo "Backing up existing .zshrc file to $zshrc_backup"
  cp "$HOME/.zshrc" "$zshrc_backup"
else
  echo "No existing .zshrc found, creating a new one."
  touch "$HOME/.zshrc" # Create an empty .zshrc file if it doesn’t exist
fi

# Clone dotfiles repo and set up symlinks with stow
echo "Cloning dotfiles repository and setting up symlinks with stow..."
cd ~
git clone git@github.com/anuragkumar2921/dotfiles.git || {
  echo "Dotfiles repository already exists. Skipping clone."
}
cd dotfiles

# Using GNU stow to create symlinks
stow .

# Cleanup Homebrew cache
echo "Cleaning up Homebrew cache..."
brew cleanup

echo "All installations and configurations completed successfully!"
