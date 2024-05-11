local color = "kanagawa-dragon"

function containsWord(str, word)
    return string.find(str, "%b"..word) ~= nil
end

function useColorScheme(color)
  color = color or "kanagawa-dragon"
  local scheme = string.match(color, "([^%-]+)")
  if scheme == "kanagawa" then
    vim.cmd([[autocmd VimEnter * lua vim.cmd.KanagawaCompile()]])
    return 0
  end
  print(color)
	vim.cmd.colorscheme(color)
end

function useTransparentBG(transparent)
  transparent = transparent or false
  if transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

useColorScheme(color)
useTransparentBG()
