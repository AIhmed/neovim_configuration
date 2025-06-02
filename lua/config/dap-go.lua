local dap = require("dap")

-- Toggle debugger UI (if using nvim-dap-ui)
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "DAP UI" })

-- Debugger controls
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>dc", dap.terminate, { desc = "Terminate" })
