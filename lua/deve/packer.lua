vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  
	use 'folke/tokyonight.nvim'
    --use({ 'rose-pine/neovim', as = 'rose-pine' })
	-- install telescope
    
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }	
    use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
    use('nvim-treesitter/playground')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')


    use('jwalton512/vim-blade')

    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('saadparwaiz1/cmp_luasnip')
    use('L3MON4D3/LuaSnip')
end)
