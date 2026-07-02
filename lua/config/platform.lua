local M = {}

local uname = (vim.uv or vim.loop).os_uname()

M.os = uname.sysname
M.is_mac = M.os == "Darwin"
M.is_linux = M.os == "Linux"
M.is_windows = M.os == "Windows_NT" or vim.fn.has("win32") == 1

return M
