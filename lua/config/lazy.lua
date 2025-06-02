-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	-- Packer can manage itself equivalent (no need for this in lazy.nvim)

	-- Kanagawa colorscheme
	{ import = "config.plugins" },

	-- Telescope and dependencies
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Treesitter and plugins
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },

	-- Utilities
	{ "mbbill/undotree" },
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},

	-- Linting and formatting
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "MunifTanjim/prettier.nvim" },

	-- Blade file support
	{ "jwalton512/vim-blade" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- LSP and Mason
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip" },
})

require("config.set")
require("config.remap")
require("config.dap-go")
