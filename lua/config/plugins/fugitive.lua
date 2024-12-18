return {
  {
  'tpope/vim-fugitive',  -- Plugin repository
  config = function()
    -- Set up key mappings for fugitive commands
    vim.keymap.set("n", "<leader>G", vim.cmd.Git)
    vim.keymap.set('n', '<leader>gs', ':Git status<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gb', ':Git branch<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gba', ':Git branch -a<CR>', { noremap = true, silent = true })
  end,
  },
  {
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
},
}
