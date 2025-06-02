return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"python",
					"javascript",
					"php",
					"html",
					"css",
					"htmldjango",
					"go",
				},

				-- Install parsers synchronously
				sync_install = false,

				-- Automatically install missing parsers
				auto_install = true,

				-- List of parsers to ignore installing
				ignore_install = {},

				highlight = {
					enable = true,

					-- Disable highlighting for specific languages or large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					-- Use both `:h syntax` and tree-sitter
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
