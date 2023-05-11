vim.keymap.set("n", "<leader>Gs", vim.cmd.Git)
vim.keymap.set('n', '<Leader>gs', ':Git status<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>gl', ':Git log<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>gb', ':Git branch<CR>', { noremap = true, silent = true })
