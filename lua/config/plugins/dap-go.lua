return {
	-- Delve Debugger (DAP)
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Configure Delve (Go)
			dap.adapters.go = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			-- Go debug configurations
			dap.configurations.go = {
				{
					type = "go",
					name = "Debug (Launch)",
					request = "launch",
					program = "${file}",
				},
				{
					type = "go",
					name = "Debug (Attach)",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
				{
					type = "go",
					name = "Debug Test (File)",
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				{
					type = "go",
					name = "Debug Test (Package)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}
		end,
	},

	-- Go-specific DAP extensions (auto-setup)
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup({
				-- Additional configurations (optional)
				delve = {
					path = "dlv", -- Ensure `dlv` is in your PATH
					initialize_timeout_sec = 20,
					args = {}, -- Extra args for `dlv dap`
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio", -- Critical!
		},
		config = function()
			require("dapui").setup()
			-- Auto-open UI on debug start
			require("dap").listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
		end,
	},
}
