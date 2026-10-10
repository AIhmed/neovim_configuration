-- LazyVim already provides <C-hjkl> window navigation, <A-j/k> line moving and the
-- system clipboard, so only your tab workflow is kept here.
local map = vim.keymap.set

map("n", "<leader>T", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First tab" })
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last tab" })
map("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Oil (parent dir)" })
