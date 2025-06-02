return {
  {
    'hrsh7th/nvim-cmp', -- Completion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip', -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping.close(),
        ['<S-Tab>'] = nil,
      })

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp_mappings,
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig', -- LSP Config
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = { 'intelephense', 'volar', 'ts_ls', 'emmet_ls', 'stimulus_ls' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          -- Customize `on_attach` if needed
          capabilities = capabilities,
        }
      end
    end,
  },
}
