return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			php = { "pint" }, -- uses vendor/bin/pint when present (ships with Laravel)
			python = { "ruff_organize_imports", "ruff_format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		formatters = {
			-- only run prettier in projects that have a prettier config; otherwise you
			-- reformat whole files in repos that never used it and get huge diffs
			prettier = { require_cwd = true },
		},
	},
}
