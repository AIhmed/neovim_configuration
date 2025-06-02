return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true, -- Enable compiling the colorscheme
				undercurl = true, -- Enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- Do not set background color
				dimInactive = false, -- Dim inactive window
				terminalColors = true, -- Define terminal colors
				colors = { -- Add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {},
					},
				},
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
}
