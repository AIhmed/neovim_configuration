-- Pins the enclosing function/class signature at the top of the window while reading long files.
return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	opts = { max_lines = 3, mode = "cursor" },
	keys = {
		{ "<leader>ux", function() require("treesitter-context").toggle() end, desc = "Toggle sticky context" },
	},
}
