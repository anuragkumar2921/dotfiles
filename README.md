# My dotfiles

This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system:
**1. HomeBrew(required)**:
  a. make sure to add brew to the path
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Git (not required for mac)
```
brew install git
```
3. Stow (not required if setting up via script)
```
brew install stow
```

#### Installation using script
1. download install.sh file from my the current repo
2. check if all the package mentioned in the Installation script is correct
3. run bash install.sh


## Manual Installation
1. First, check out the dotfiles repo in your $HOME directory using git
```
cd ~
git clone git@github.com/anuragkumar2921/dotfiles.git
cd dotfiles
```
2. then use GNU stow to create symlinks
```
stow .
```

## Tmux cheat sheet
start a tmux session name - test
```
new test
```
attach to tmux session
```
attach test
```
source the tmux conf
```
tmux source tmux.
```
reload tmux environment
```
prefix + I
```
