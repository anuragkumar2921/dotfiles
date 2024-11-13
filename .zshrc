# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#load starship theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

#Home brew
export PATH="/opt/homebrew/bin:$PATH"

#java and mvn related
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/opt/homebrew/opt/tomcat@8/bin:$PATH"


#dir aliase
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#git alias
alias gs="git status"
alias gd="git diff"
alias gc="git checkout"
alias pull="git pull"
alias push="git push"
alias gl="git log"
alias ga="git add"
alias gco="git commit -m"
alias lg="lazygit"


#alias
alias src="source ~/.zshrc"
alias vsh="vim ~/.zshrc" 
alias hs="history | grep"
alias c="clear"

#tmux alias
alias detach="tmux detach"
alias new="tmux new -s "
alias attach="tmux attach -t"

#brew alias
alias bs="brew search"
alias bi="brew install"
alias bu="brew uninstall"

#fd alias
alias f="fd --type f --hidden --exclude .git | fzf | xargs nvim"

# vim aliases
alias vim="nvim"

# export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
export WORDCHARS='*?_[]~&;!#$%^(){}<>'

# eza alias
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'
alias lS='eza -1 --color=always --group-directories-first --icons'
alias ltree='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"

#alias for zoxide
alias cd='z'

# bat alias
alias cat='bat'
alias fz='fzf --preview="bat --color=always {}"'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

#leetcode alias
alias leetcode='nvim leetcode.nvim'

# ranger
export VISUAL=nvim;
export EDITOR=nvim;

#load secret
export OPENAI_API_KEY=$(<~/gpt_secret.txt)

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

neofetch

