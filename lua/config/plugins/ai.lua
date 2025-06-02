return {
  "olimorris/codecompanion.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "stevearc/dressing.nvim", -- Optional: Improves UI
      opts = {},
    },
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "ollama",
          model = "llama3", -- 👈 Use llama3 instead of deepseek-coder-v2
          keymaps = {
            send = {
              modes = {
                n = { "<CR>" },
                i = {"<C-s>"},
              },
            },
            close = {
              modes = {
                n = "q",
                i = "<c-x>",
              },
            },
            stop = {
              modes = {
                n = "<c-x>",
              },
            }
          }
        },
        inline = {
          adapter = "ollama",
          model = "llama3", -- 👈 Also set for inline completions
        },
        agent = {
          adapter = "ollama",
          model = "llama3", -- 👈 And for agent mode
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "llama3", -- 👈 Default model
              },
            },
          })
        end,
      },
    })

    -- Keymaps
    vim.keymap.set('n', '<leader>ccc', '<CMD>CodeCompanionChat<CR>', { noremap = true, silent = true })
    vim.keymap.set("v", "<leader>cca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
  end
}
