-- Language servers. Do NOT also enable the LazyVim lang.php / python / typescript /
-- json / yaml / docker extras: they would attach a second server to the same buffers.
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "b0o/SchemaStore.nvim" },
		opts = function(_, opts)
			opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
				severity_sort = true,
				update_in_insert = false,
				float = { border = "rounded", source = true },
			})

			opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
				-- PHP / Laravel. phpactor is free including rename/refactors;
				-- intelephense gates several features behind a paid licence.
				phpactor = {},

				-- TypeScript / JavaScript / Next.js
				vtsls = {
					keys = {
						{
							"<leader>co",
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = { only = { "source.organizeImports" }, diagnostics = {} },
								})
							end,
							desc = "Organize Imports",
						},
					},
				},
				eslint = { settings = { workingDirectories = { mode = "auto" } } },
				tailwindcss = {},
				html = {},
				cssls = {},

				-- Python / Django
				pyright = {},
				ruff = {},

				-- Infra / config
				dockerls = {},
				docker_compose_language_service = {},
				bashls = {},
				jsonls = {
					settings = {
						json = {
							validate = { enable = true },
							schemas = require("schemastore").json.schemas(),
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
							schemaStore = { enable = false, url = "" }, -- use SchemaStore.nvim instead
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
			})
			return opts
		end,
	},
}
