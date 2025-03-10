return {
  {
    'neovim/nvim-lspconfig', -- LSP Config
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf, remap = false }
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "<leader>Di", function() vim.diagnostic.disable() end, opts)
          vim.keymap.set("n", "<leader>De", function() vim.diagnostic.enable() end, opts)
          vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
      })
            local lspconfig = require("lspconfig")

      -- Emmet LSP
      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "blade" }
      })

      -- Intelephense (PHP LSP)
      lspconfig.intelephense.setup({
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "Core", "curl", "date", "dom",
              "fileinfo", "filter", "gd", "gettext", "hash",
              "iconv", "json", "libxml", "mbstring", "openssl",
              "pcre", "PDO", "pdo_mysql", "Phar", "readline",
              "Reflection", "session", "SimpleXML", "sockets",
              "sodium", "standard", "tokenizer", "xml", "xdebug",
              "zip", "zlib", "wordpress", "woocommerce", "acf",
              "phpunit"
            },
            environment = {
              phpVersion = "8.1"
            }
          }
        }
      })

      -- Vue.js LSP (Volar)
      lspconfig.volar.setup({
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" }
      })
    end,
  },
  {
    'williamboman/mason.nvim', -- Mason for LSP, DAP, linters, and formatters
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim', -- Bridge Mason and LSPconfig
    dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
}
