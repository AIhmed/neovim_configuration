-- Ctrl-h/j/k/l moves between nvim splits and tmux panes as one grid.
-- Outside tmux it behaves like the plain <C-w>h/j/k/l window navigation.
return {
	"christoomey/vim-tmux-navigator",
	cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window left (tmux aware)" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window down (tmux aware)" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window up (tmux aware)" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window right (tmux aware)" },
	},
}
