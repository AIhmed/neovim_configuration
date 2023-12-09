vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move around and create tabs for files 
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)

-- tiling and spliting the screen
vim.keymap.set("n", "<leader>ve", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>he", vim.cmd.Hexplore)
vim.keymap.set("n", "<leader>te", vim.cmd.Texplore)
vim.keymap.set("n", "<leader>le", ":Lexplore <CR>:vertical resize 20<CR>")
vim.keymap.set("n", "<leader>se", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>re", vim.cmd.Rexplore)

-- switch between netrw windows
vim.keymap.set("n", "<A-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<A-l>", "<C-w>l<CR>")
vim.keymap.set("n", "<A-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<A-j>", "<C-w>j<CR>")

-- move up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
