return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Define common capabilities with LSP enhancements
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      
      -- Common on_attach function for all LSP servers
      local on_attach = function(client, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        
        local opts = { buffer = bufnr, remap = false }
        local keymap = vim.keymap.set
        
        -- Key mappings
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
        keymap("n", "<leader>D", vim.diagnostic.open_float, opts)
        keymap("n", "<leader>Di", vim.diagnostic.disable, opts)
        keymap("n", "<leader>De", vim.diagnostic.enable, opts)
        keymap("n", "gn", vim.diagnostic.goto_next, opts)
        keymap("n", "gp", vim.diagnostic.goto_prev, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>rf", vim.lsp.buf.references, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        
        -- Format on save if the server supports it
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end
          })
        end
      end

      local lspconfig = require("lspconfig")

      -- Emmet LSP (improved config)
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 
          "html", "css", "javascriptreact", 
          "typescriptreact", "vue", "blade",
          "javascript", "typescript"  -- Added these for better JS/TS support
        },
      })

      -- PHP (Intelephense)
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo",
              "filter", "gd", "gettext", "hash", "iconv", "json", "libxml",
              "mbstring", "openssl", "pcre", "PDO", "pdo_mysql", "Phar",
              "readline", "Reflection", "session", "SimpleXML", "sockets",
              "sodium", "standard", "tokenizer", "xml", "xdebug", "zip",
              "zlib", "wordpress", "woocommerce", "acf", "phpunit"
            },
            environment = { phpVersion = "8.1" },
          },
        },
      })

      -- TypeScript (using tsserver with improved config)
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 
          "javascript", "typescript", 
          "javascriptreact", "typescriptreact",
          "vue"  -- Important for Vue SFC support
        },
        root_dir = lspconfig.util.root_pattern(
          "package.json", "tsconfig.json", "jsconfig.json", ".git"
        ),
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "relative",
            jsxAttributeCompletionStyle = "auto"
          }
        }
      })

      -- Go (gopls)
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = false,
          },
        },
      })

      -- Vue.js (using volar instead of vue_ls)
      lspconfig.volar.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "vue", "javascript", "typescript" },
        init_options = {
          vue = {
            hybridMode = false,  -- Set to true if using Vue 2
          },
          typescript = {
            tsdk = require('lspconfig.util').get_typescript_server_path()
          }
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "gopls", 
          "intelephense", 
          "tsserver",  -- Changed from ts_ls to tsserver
          "emmet_ls",
          "vue_ls"      -- Added volar for Vue
        },
        automatic_installation = true,
      })
    end,
  },
}
