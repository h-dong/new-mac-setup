#!/bin/bash

# ============ Configure ZSH ============

# If .zshrc includes history setup text, skip this section
if ! grep -q "ZSH history" ~/.zshrc; then
    echo '

# ZSH history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ZSH completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
' >> ~/.zshrc
fi

# ============ Installations ============

# Install wezterm
if ! command -v wezterm &> /dev/null; then
    brew install --cask wezterm
fi

# Install ZSH plugins
if ! brew list zsh-autosuggestions &> /dev/null; then
    brew install zsh-autosuggestions

    echo '

# ZSH autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
' >> ~/.zshrc
fi

if ! brew list zsh-syntax-highlighting &> /dev/null; then
    brew install zsh-syntax-highlighting

    echo '
# ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
' >> ~/.zshrc
fi

# Install powerlevel10k colour scheme
if ! brew list powerlevel10k &> /dev/null; then
    brew install powerlevel10k

    echo '

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
' >> ~/.zshrc
fi

# Install nerd font
if ! brew list font-meslo-lg-nerd-font &> /dev/null; then
    brew install font-meslo-lg-nerd-font
fi

# Install eza
if ! command -v eza &> /dev/null; then
    brew install eza

    echo '

# EZA
alias ls="eza --icons=auto --color=always --git"
alias ll="eza --icons=auto --color=always --git --long"
alias la="eza --icons=auto --color=always --git --all"
alias tree="eza --icons=auto --color=always --git --tree"
' >> ~/.zshrc
fi

# Install zoxide
if ! command -v zoxide &> /dev/null; then
    brew install zoxide

    echo '

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"
' >> ~/.zshrc
fi

# Install fzf
if ! command -v fzf &> /dev/null; then
    brew install fzf

        echo '
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
' >> ~/.zshrc

    # Install fzf-git.sh
    cd ~
    git clone https://github.com/junegunn/fzf-git.sh.git
    echo 'source ~/fzf-git.sh/fzf-git.sh' >> ~/.zshrc
    cd -
fi

# Install fd
if ! command -v fd &> /dev/null; then
    brew install fd
    
    # Append fd configuration to end of .zshrc
    echo '

# -- Use fd instead of fzf --

export FZF_CTRL_T_OPTS="--preview '\''$show_file_or_dir_preview'\''"
export FZF_ALT_C_OPTS="--preview '\''eza --tree --color=always {} | head -200'\''"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview '\''eza --tree --color=always {} | head -200'\'' "$@" ;;
        export|unset) fzf --preview "eval '\''echo ${}'\''"         "$@" ;;
        ssh)          fzf --preview '\''dig {}'\''                   "$@" ;;
        *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
}

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}' >> ~/.zshrc
fi

if ! command -v bat &> /dev/null; then
    brew install bat

    mkdir -p "$(bat --config-dir)/themes"
    cd "$(bat --config-dir)/themes"
    curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
    bat cache --build

    echo '

# BAT (better cat)
export BAT_THEME=tokyonight_night
' >> ~/.zshrc
fi

# Install git-delta
if ! command -v delta &> /dev/null; then
    brew install git-delta

    echo '
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true
    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true
[merge]
    conflictstyle = diff3
[diff]
    colorMoved = default
' >> ~/.gitconfig
fi

# Install tldr
if ! command -v tldr &> /dev/null; then
    brew install tldr
fi

# Install thefuck
if ! command -v thefuck &> /dev/null; then
    brew install thefuck

    echo '

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)T
' >> ~/.zshrc
fi

# Install macmon
if ! command -v macmon &> /dev/null; then
    brew install macmon
fi

# Install lazygit
if ! command -v lazygit &> /dev/null; then
    brew install jesseduffield/lazygit/lazygit
fi

# ============ Copy dotfiles ============

# Copy the wezterm config to the home directory
cp -p ./dotfiles/.wezterm.lua ~/.wezterm.lua

# Copy the powerlevel10k config to the home directory
cp -p ./dotfiles/.p10k.zsh ~/.p10k.zsh