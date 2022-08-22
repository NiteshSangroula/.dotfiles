-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim") -- package manager

    -- colorscheme
    use("morhetz/gruvbox")

    use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

    --TELESCOPE
    use("nvim-telescope/telescope.nvim")
    use("nvim-lua/plenary.nvim")
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- for autocomplete
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

end)
