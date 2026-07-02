vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move around and create tabs for files
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>tf", vim.cmd.tabfirst)
vim.keymap.set("n", "<leader>tl", vim.cmd.tablast)

-- tiling and spliting the screen
vim.keymap.set("n", "<leader>ve", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>he", vim.cmd.Hexplore)
vim.keymap.set("n", "<leader>te", vim.cmd.Texplore)
vim.keymap.set("n", "<leader>le", ":Lexplore <CR>:vertical resize 20<CR>")
vim.keymap.set("n", "<leader>se", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>re", vim.cmd.Rexplore)

-- Window navigation: Ctrl+hjkl in normal mode (Option+hjkl is unreliable on macOS terminals)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- move up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- macOS uses the system clipboard via vim.opt.clipboard in set.lua
-- gy still forces an explicit copy to the + register when needed
vim.keymap.set("v", "gy", '"+y', { silent = true, desc = "Yank to system clipboard" })
