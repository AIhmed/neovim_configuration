local function refactor(name)
	return function()
		return require("refactoring").refactor(name)
	end
end

return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"lewis6991/async.nvim", -- required by newer releases, harmless otherwise
		},
		opts = {},
		keys = {
			{ "<leader>re", refactor("Extract Function"), mode = { "n", "x" }, expr = true, desc = "Extract function" },
			{ "<leader>rf", refactor("Extract Function To File"), mode = { "n", "x" }, expr = true, desc = "Extract function to file" },
			{ "<leader>rv", refactor("Extract Variable"), mode = { "n", "x" }, expr = true, desc = "Extract variable" },
			{ "<leader>ri", refactor("Inline Variable"), mode = { "n", "x" }, expr = true, desc = "Inline variable" },
			{ "<leader>rI", refactor("Inline Function"), mode = { "n", "x" }, expr = true, desc = "Inline function" },
		},
	},
	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			opts.spec = opts.spec or {}
			table.insert(opts.spec, { "<leader>r", group = "refactor", mode = { "n", "x" } })
		end,
	},
}
