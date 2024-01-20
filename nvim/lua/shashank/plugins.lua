local plugins = {
    ---------------------------------------------------------------
    --commenting
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {}
        end
    },
    ---------------------------------------------------------------
    --lualine
    {
      'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup {
                icons_enabled = true,
                theme = 'nightfox'
            }
        end
    },
    ---------------------------------------------------------------
    --icons
    { 'nvim-tree/nvim-web-devicons' },
    ---------------------------------------------------------------
    --treeshitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    ---------------------------------------------------------------
    --telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    ---------------------------------------------------------------
    --colorscheme
    {"EdenEast/nightfox.nvim"},
    ---------------------------------------------------------------
    --codeium
    "Exafunction/codeium.vim",
    ---------------------------------------------------------------
    --for i dont know why
    "nvim-tree/nvim-web-devicons",
    ---------------------------------------------------------------
    --for lsp keymaps and stuff
    "neovim/nvim-lspconfig",
    ---------------------------------------------------------------
    --for downloading language servers
    "williamboman/mason.nvim",
    ---------------------------------------------------------------
    --for mason-lspconfig i dont know why
    "williamboman/mason-lspconfig.nvim",
    ---------------------------------------------------------------
    --completions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp'
        }
    },
    ---------------------------------------------------------------
}




local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)
