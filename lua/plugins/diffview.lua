-- Full-screen diff / merge-conflict / file-history views. Close with :DiffviewClose.
return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	keys = {
		{ "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview (working tree)" },
		{ "<leader>gV", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
	},
	opts = { enhanced_diff_hl = true },
}
