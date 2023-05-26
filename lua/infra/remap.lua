vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move around and create tabs for files 
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn)

-- tiling and spliting the screen
vim.keymap.set("n", "<leader>V", vim.cmd.Vexplore)
vim.keymap.set("n", "<leader>H", vim.cmd.Hexplore)


-- move up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
