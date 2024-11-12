#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# Log output setup: store all output in install_log.txt
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

# List of packages to install, including both brew and brew cask packages
packages=(
  "kitty --cask"
  "ranger"
  "nvim"
  "eza"
  "stow"
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
  # Extract the package name (first word before any spaces)
  pkg_name=$(echo "$package" | awk '{print $1}')

  if is_installed "$pkg_name"; then
    echo "✅ $pkg_name is already installed. Skipping."
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

# Cleanup Homebrew cache
echo "Cleaning up Homebrew cache..."
brew cleanup

echo "All installations completed successfully (or were already present)!"
