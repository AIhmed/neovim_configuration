-- File management as a buffer. <leader>e toggles a left sidebar, "-" opens the parent dir.
local function toggle_sidebar()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.w[win].oil_sidebar then
			vim.api.nvim_win_close(win, true)
			return
		end
	end
	vim.cmd("topleft 30vsplit")
	vim.w.oil_sidebar = true
	vim.wo.winfixwidth = true
	require("oil").open()
end

return {
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{
		"stevearc/oil.nvim",
		lazy = false, -- oil must be loaded to hijack directory buffers
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local oil = require("oil")
			oil.setup({
				default_file_explorer = true,
				-- default keymaps bind <C-h>/<C-l>, which breaks window navigation
				use_default_keymaps = false,
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<cr>"] = {
						desc = "Select (sidebar-aware)",
						callback = function()
							local entry = oil.get_cursor_entry()
							if not entry then
								return
							end
							if entry.type == "directory" or not vim.w.oil_sidebar then
								return oil.select()
							end
							local path = oil.get_current_dir() .. entry.name
							vim.cmd("wincmd p")
							vim.cmd("edit " .. vim.fn.fnameescape(path))
						end,
					},
					["gs"] = { "actions.select", opts = { horizontal = true } },
					["gv"] = { "actions.select", opts = { vertical = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["gp"] = "actions.preview",
					["gr"] = "actions.refresh",
					["q"] = { "actions.close", mode = "n" },
					["gc"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gh"] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
					["gx"] = "actions.open_external",
					["go"] = { "actions.change_sort", mode = "n" },
				},
				view_options = {
					show_hidden = true,
					natural_order = "fast",
					sort = { { "type", "asc" }, { "name", "asc" } },
				},
			})
			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>e", toggle_sidebar, { desc = "Oil sidebar" })
		end,
	},
}
