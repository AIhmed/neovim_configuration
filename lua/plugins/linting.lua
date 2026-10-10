-- Most diagnostics come from LSP (eslint, ruff, phpactor). nvim-lint only fills gaps.
return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			dockerfile = { "hadolint" },
		},
	},
}
