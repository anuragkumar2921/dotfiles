# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
cd ~
git clone git@github.com/anuragkumar2921/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```
stow .
```
## Tmux Installation
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
