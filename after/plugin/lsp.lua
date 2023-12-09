local lsp = require("lsp-zero")

lsp.preset("recommended")

-- we put here the lsp server


--local ansible = lsp.ansiblels.setup{}


lsp.configure('ansiblels',  {
  cmd = { "ansible-language-server", "--stdio"},
  filetypes = {
       "yaml.ansible"
  },
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
        useFullyQualifiedCollectionNames = true
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python3"
      },
      completion = {
          provideRedirectModules = true,
          provideModuleOptionAliases = true
      }
    },
  },
}
)


lsp.configure('intelephense',  {
  cmd = { "intelephense", "--stdio"},
  filetypes = {
       "php"
  }
  }
)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ['<Tab>'] = cmp.mapping.close(),
  ['<S-Tab>'] = nil
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

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
end)


lsp.setup()
