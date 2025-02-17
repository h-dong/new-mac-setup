#!/bin/bash

# ============ Installations ============

# Install wezterm
if ! command -v wezterm &> /dev/null; then
    brew install --cask wezterm
fi

# Install ZSH plugins
if ! brew list zsh-autosuggestions &> /dev/null; then
    brew install zsh-autosuggestions
fi

if ! brew list zsh-syntax-highlighting &> /dev/null; then
    brew install zsh-syntax-highlighting
fi

# Install powerlevel10k colour scheme
if ! brew list powerlevel10k &> /dev/null; then
    brew install powerlevel10k
fi

# Install nerd font
if ! brew list font-meslo-lg-nerd-font &> /dev/null; then
    brew install font-meslo-lg-nerd-font
fi

# Install eza
if ! command -v eza &> /dev/null; then
    brew install eza
fi

# Install zoxide
if ! command -v zoxide &> /dev/null; then
    brew install zoxide
fi

# Install fzf
if ! command -v fzf &> /dev/null; then
    brew install fzf

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

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

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

# ----- Bat (better cat) -----

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
eval $(thefuck --alias fk)
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

# ============ Configure Wezterm ============

# Copy the wezterm config to the home directory
cp -p ./dotfiles/.wezterm.lua ~/.wezterm.lua

# Copy the powerlevel10k config to the home directory
cp -p ./dotfiles/.p10k.zsh ~/.p10k.zsh