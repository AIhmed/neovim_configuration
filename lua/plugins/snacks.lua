-- snacks.nvim is one plugin with many modules: picker (file finder / grep / LSP symbols),
-- notifier, explorer, scroll. One file because it is one plugin.
local excludes = {
	".git",
	"node_modules",
	".next",
	".venv",
	"__pycache__",
	"vendor",
	"storage/framework",
	"storage/logs",
}

return {
	"folke/snacks.nvim",
	opts = {
		explorer = { enabled = false }, -- oil replaces it
		scroll = { enabled = false },
		notifier = { timeout = 4000, style = "compact" },
		picker = {
			sources = {
				files = { hidden = true, exclude = excludes },
				grep = { hidden = true, exclude = excludes },
			},
		},
	},
}
