return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				keymaps = {
					-- Help
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["gs"] = { "actions.select", opts = { horizontal = true } },
					["gv"] = { "actions.select", opts = { vertical = true } },
					["gt"] = { "actions.select", opts = { tab = true } },
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["gp"] = "actions.preview",
					["gr"] = "actions.refresh",
					["q"] = { "actions.close", mode = "n" },
					["gc"] = { "actions.cd", mode = "n" },
					["gC"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gh"] = { "actions.toggle_hidden", mode = "n" },
					["gT"] = { "actions.toggle_trash", mode = "n" },
					["gx"] = "actions.open_external",
					["gS"] = { "actions.change_sort", mode = "n" },
				},
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
					-- This function defines what is considered a "hidden" file
					is_hidden_file = function(name, bufnr)
						local m = name:match("^%.")
						return m ~= nil
					end,
					-- This function defines what will never be shown, even when `show_hidden` is set
					is_always_hidden = function(name, bufnr)
						return false
					end,
					-- Sort file names with numbers in a more intuitive order for humans.
					-- Can be "fast", true, or false. "fast" will turn it off for large directories.
					natural_order = "fast",
					-- Sort file and directory names case insensitive
					case_insensitive = false,
					sort = {
						-- sort order can be "asc" or "desc"
						-- see :help oil-columns to see which columns are sortable
						{ "type", "asc" },
						{ "name", "asc" },
					},
					-- Customize the highlight group for the file name
					highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
						return nil
					end,
				},
			})
			-- Optional: Set keybinding to open Oil
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
