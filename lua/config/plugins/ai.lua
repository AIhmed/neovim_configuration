return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"stevearc/dressing.nvim",
			opts = {},
		},
	},
	config = function()
		require("codecompanion").setup({
			-- ===== Optimized for Code Generation =====
			strategies = {
				chat = {
					adapter = "ollama",
					model = "deepseek-coder:6.7b-instruct", -- Best for complex code gen
					system_prompt = "You are an expert coding assistant. Generate clean, production-ready code with brief explanations when asked.",
					keymaps = {
						send = {
							modes = {
								n = { "<CR>" },
								i = { "<C-s>" },
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
						},
					},
				},
				inline = {
					adapter = "ollama",
					model = "deepseek-coder:6.7b-instruct", -- Best for complex code gen
					temperature = 0.2, -- More deterministic
				},
				code_generation = { -- New strategy for your use case
					enabled = true,
					adapter = "ollama",
					model = "deepseek-coder:6.7b-instruct", -- Best for complex code gen
					num_ctx = 4096, -- Larger context for big files
				},
			},
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "deepseek-coder:6.7b-instruct", -- Best for complex code gen
								choices = { -- Model switcher
									"deepseek-coder:33b-instruct",
								},
							},
							temperature = {
								default = 0.3, -- Balanced creativity
							},
						},
					})
				end,
			},
		})

		-- ===== Enhanced Keymaps =====
		-- Interactive Chat
		vim.keymap.set("n", "<leader>cc", "<CMD>CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" })

		-- Code Generation Shortcuts
		vim.keymap.set("n", "<leader>cg", function()
			require("codecompanion").generate({
				prompt = vim.fn.input("Generate code > "),
				strategy = "code_generation",
			})
		end, { desc = "Generate Code" })

		-- Visual Mode Actions
		vim.keymap.set("v", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "Code Actions" })
		vim.keymap.set("v", "ga", "<cmd>CodeCompanionAdd<cr>", { desc = "Add Code" })
	end,
}
