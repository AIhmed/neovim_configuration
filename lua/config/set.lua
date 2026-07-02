local platform = require("config.platform")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.laststatus = 2
vim.opt.cmdheight = 0

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "100"

-- Sync yanks with the macOS clipboard (requires Neovim built with +clipboard, e.g. brew install neovim)
if platform.is_mac then
	vim.opt.clipboard = "unnamedplus"
elseif vim.fn.has("clipboard") == 1 then
	vim.opt.clipboard = "unnamedplus"
end
