-- OPTIONAL: HTTP client for .http files (API testing without leaving the editor).
-- Needs curl; run :checkhealth kulala after install. Delete this file if you use Bruno/Postman.
return {
	"mistweaverco/kulala.nvim",
	ft = { "http", "rest" },
	opts = { global_keymaps = false },
	keys = {
		{ "<leader>Rs", function() require("kulala").run() end, ft = { "http", "rest" }, desc = "Send request" },
		{ "<leader>Ra", function() require("kulala").run_all() end, ft = { "http", "rest" }, desc = "Send all requests" },
	},
}
