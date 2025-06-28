require("config.lazy")
local function safeOllamaPrompt(prompt)
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))
  
  -- Ensure proper column ordering
  if start_row == end_row and start_col > end_col then
    start_col, end_col = end_col, start_col
  end
  
  require('ollama').prompt(prompt, {
    selection = {
      start = { start_row, start_col },
      finish = { end_row, end_col }
    }
  })
end

vim.keymap.set("v", "<leader>oe", function()
  safeOllamaPrompt("Explain this code:")
end)
