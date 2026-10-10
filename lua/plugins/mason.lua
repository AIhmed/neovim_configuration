-- Non-LSP tools installed through mason. Servers in lsp.lua are installed automatically.
return {
	"mason-org/mason.nvim",
	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, {
			"stylua",
			"shfmt",
			"prettier",
			"hadolint",
		})
	end,
}
