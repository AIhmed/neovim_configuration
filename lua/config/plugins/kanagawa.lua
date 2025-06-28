return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        -- Your existing setup options...
        transparent = false, -- Ensure this is false
        overrides = function(colors)
          return {
            Normal = { bg = colors.theme.ui.bg }, -- Force solid background
            NormalFloat = { bg = colors.theme.ui.bg }, -- Force solid float backgrounds
            FloatBorder = { bg = colors.theme.ui.bg }, -- Optional: if you use floating windows
          }
        end,
      })
      vim.cmd("colorscheme kanagawa-dragon") -- Apply the colorscheme
    end,
  },
}
