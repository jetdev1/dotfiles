vim.cmd [[packadd packer.nvim]]

local status, packer = pcall(require, "packer")
if (not status) then print("Packer is not installed.")
    return
end

packer.startup(function(use)
    -- [[ CORE ]] 
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'

    -- [[ UI ]]
    use 'goolord/alpha-nvim'
    use 'Shatur/neovim-session-manager'
    use 'romgrk/barbar.nvim'
--  use 'luisiacc/gruvbox-baby'
    use 'sainnhe/everforest'
    use 'karb94/neoscroll.nvim'
    use { 'kyazdani42/nvim-tree.lua',       -- File tree viewer
      requires = { 'kyazdani42/nvim-web-devicons' }} -- optional, for file icons 
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- [[ LSP ]]
    use 'neovim/nvim-lspconfig'
    use {
      'glepnir/lspsaga.nvim',
      branch = 'main'
    }

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'konfekt/vim-compilers'

    -- [[ Telescope ]]
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- [[ Editor ]]
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'Vimjas/vim-python-pep8-indent'

    -- [[ git ]]
    use 'lewis6991/gitsigns.nvim'

    -- [[ Markdown ]]
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }, })

end)
