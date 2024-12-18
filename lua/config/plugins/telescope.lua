return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set

      -- Key mappings for Telescope
      keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      keymap("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep: ") })
      end, { desc = "Grep String" })
    end,
  },
}
