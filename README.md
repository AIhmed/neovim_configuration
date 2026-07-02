# Neovim Configuration

Personal Neovim setup with Lazy.nvim, tuned for macOS (MacBook).

## Installation

### 1. Install Neovim

#### macOS (recommended)

```bash
brew install neovim
```

Homebrew builds Neovim with `+clipboard`, so copy/paste works with the system clipboard out of the box.

#### Linux

Download the latest stable release from:
https://github.com/neovim/neovim/releases

```bash
tar xzvf nvim-linux64.tar.gz -C ~/.local/bin
ln -s ~/.local/bin/nvim-linux64/bin/nvim ~/.local/bin/nvim
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Windows

1. Extract the zip file to `%USERPROFILE%\AppData\Local\`
2. Add `nvim-win64\bin` to your System PATH

### 2. Install dependencies (macOS)

```bash
brew install git ripgrep fd node go
```

Optional tools used by formatters and LSP:

```bash
brew install stylua prettierd delve ollama
```

### 3. Clone configuration

```bash
git clone -b mac-config https://github.com/AIhmed/neovim_configuration ~/.config/nvim
```

Windows: clone to `%USERPROFILE%\AppData\Local\nvim\`

### 4. First run

Launch Neovim and plugins will install automatically:

```bash
nvim
```

## macOS keybindings

| Action | Key |
|--------|-----|
| Window navigation | `Ctrl+h/j/k/l` (normal mode) |
| Trigger completion | `Ctrl+e` (insert mode) |
| LSP signature help | `Ctrl+k` (insert mode) |
| Yank to clipboard | `gy` (visual mode) |
| CodeCompanion send | `Ctrl+Enter` (insert mode, chat) |
| DAP continue | `<leader>dr` or `F5` (with Fn) |
| DAP breakpoint | `<leader>db` or `F9` (with Fn) |

## Features

- Lazy.nvim plugin manager
- Pre-configured LSP support (intelephense, volar, gopls, emmet_ls, ts_ls, stimulus_ls)
- Treesitter syntax highlighting
- Formatting with conform
- Telescope for project and file searching
- Custom key mappings
- Undotree
- Fugitive for git integration
- vim-flog
- Tokyo Night colorscheme

## Customization

Edit files in `lua/config/` to modify settings.

## Requirements

- Neovim 0.9+
- Git
