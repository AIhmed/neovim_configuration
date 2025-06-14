return {
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"dart-lang/dart-vim-plugin",
			"nvim-lua/plenary.nvim",
		},
		ft = { "dart" },
		config = function()
			require("flutter-tools").setup({
				lsp = {
					on_attach = function(client, bufnr)
						-- Create a fresh opts table for each buffer
						local opts = { buffer = bufnr, silent = true, noremap = true }

						-- ALL YOUR ORIGINAL KEYMAPS (now properly buffer-local)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

						-- WORKING DIAGNOSTICS KEYMAPS (both versions)
						vim.keymap.set("n", "<leader>D", function()
							vim.diagnostic.open_float({
								scope = "line",
								focusable = false,
								border = "rounded",
							})
						end, opts)
						vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

						-- REST OF YOUR ORIGINAL KEYMAPS
						vim.keymap.set("n", "<leader>Di", vim.diagnostic.disable, opts)
						vim.keymap.set("n", "<leader>De", vim.diagnostic.enable, opts)
						vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
						vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
						vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
						vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
						vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

						-- FLUTTER-SPECIFIC KEYMAPS
						vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", opts)
						vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", opts)
						vim.keymap.set("n", "<leader>fe", ":FlutterEmulators<CR>", opts)
						vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>", opts)

						-- Verify all keymaps exist (debugging)
					end,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						dart = {
							completeFunctionCalls = true,
							showTodos = true,
							enableSnippets = true,
						},
					},
				},
				widget_guides = {
					enabled = true,
				},
				dev_log = {
					enabled = true,
					open_cmd = "tabedit",
				},
			})
		end,
	},
}
