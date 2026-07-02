return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure it loads first
		config = function()
			require("tokyonight").setup({
				style = "moon", -- storm | moon | night | day
				transparent = false,
				styles = {
					sidebars = "dark",
					floats = "dark",
				},
			})

			vim.cmd("colorscheme tokyonight")
		end,
	},
}
