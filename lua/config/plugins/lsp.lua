return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Define common capabilities with LSP enhancements
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
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
				-- <C-k> avoids macOS insert-mode <C-h> backspace conflict
				keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)
			end

			-- Use vim.lsp.config() (nvim 0.11+); nvim-lspconfig provides defaults via lsp/*.lua

			-- Emmet LSP (improved config)
			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"blade",
					"twig",
				},
			})

			-- PHP (Intelephense)
			vim.lsp.config("intelephense", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					intelephense = {
						stubs = {
							"bcmath",
							"bz2",
							"Core",
							"curl",
							"date",
							"dom",
							"fileinfo",
							"filter",
							"gd",
							"gettext",
							"hash",
							"iconv",
							"json",
							"libxml",
							"mbstring",
							"openssl",
							"pcre",
							"PDO",
							"pdo_mysql",
							"Phar",
							"readline",
							"Reflection",
							"session",
							"SimpleXML",
							"sockets",
							"sodium",
							"standard",
							"tokenizer",
							"xml",
							"xdebug",
							"zip",
							"zlib",
							"wordpress",
							"woocommerce",
							"acf",
							"phpunit",
						},
						environment = { phpVersion = "8.1" },
					},
				},
			})
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- TypeScript (ts_ls with improved config)
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"vue",
				},
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						jsxAttributeCompletionStyle = "auto",
					},
				},
			})

			-- Go (gopls)
			vim.lsp.config("gopls", {
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

			vim.lsp.config("volar", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("stimulus_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Terraform
			vim.lsp.config("terraformls", {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "terraform", "tf" },
				root_markers = { ".terraform", ".git" },
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
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"intelephense",
					"ts_ls",
					"emmet_ls",
					"terraformls",
					"basedpyright",
					"volar",
					"stimulus_ls",
				},
				automatic_installation = true,
			})
		end,
	},
}
