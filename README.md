# Neovim Configuration

My personal Neovim setup with Lazy.nvim plugin manager.

## Installation

### 1. Install Neovim

Download the latest stable release from:
https://github.com/neovim/neovim/releases

#### Linux/macOS
```bash
# Extract to local directory
tar xzvf nvim-linux64.tar.gz -C ~/.local/bin

# Create symlink
ln -s ~/.local/bin/nvim-linux64/bin/nvim ~/.local/bin/nvim

# Add to PATH (for bash/zsh)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Windows

1. Extract the zip file to %USERPROFILE%\AppData\Local\

2. Add nvim-win64\bin to your System PATH

### 2. Clone Configuration
```
git clone -b lazy_config https://github.com/AIhmed/neovim_configuration ~/.config/nvim
```

Windows: Clone to `%USERPROFILE%\AppData\Local\nvim\`

### 3. First Run

Launch Neovim and plugins will install automatically:
```
nvim
```
## Features:
- Lazy.nvim plugin manager
- Pre-configured LSP support (intelephense, volar, gopls, emmet_ls, tl_ls, stimulus_ls)
- Treesitter syntax highlighting
- Formatting using conform
- Telescope for project and file searching
- Custom key mappings
- Undotree
- fugitive for git integration
- vimflog 
- kanagawa colorscheme

## Customization

Edit files in lua/config/ to modify settings.

### Requirements:

- Neovim 0.9+
- Git


### This version:
- Uses clean markdown formatting
- Has proper code blocks
- Includes all installation steps
- Lists key features
- Is more concise while keeping all essential information
- Works perfectly when copied directly to a README.md file
