return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, {
			"php", "php_only", "phpdoc", "blade",
			"javascript", "typescript", "tsx",
			"python", "htmldjango",
			"html", "css", "json", "jsonc", "yaml", "toml",
			"dockerfile", "bash", "sql", "regex",
			"lua", "vim", "vimdoc",
			"markdown", "markdown_inline",
			"diff", "git_config", "gitcommit",
		})
	end,
}
