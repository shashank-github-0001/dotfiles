local lazypath         = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    ---------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    ---------------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    ---------------------------------------------------------------------
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    ---------------------------------------------------------------------
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    ---------------------------------------------------------------------
    {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    ---------------------------------------------------------------------
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    ---------------------------------------------------------------------
    {
        'ryanoasis/vim-devicons',
    },
    ---------------------------------------------------------------------
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    ---------------------------------------------------------------------
    {
        "vimwiki/vimwiki",
    },
    ---------------------------------------------------------------------
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    ---------------------------------------------------------------------
    --colorscheme
    { "EdenEast/nightfox.nvim" },
    ---------------------------------------------------------------------
    --colorscheme
    { 'dylanaraps/wal.vim'},
    ---------------------------------------------------------------------
    { "rose-pine/neovim", name = "rose-pine" },
    ---------------------------------------------------------------------
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    ---------------------------------------------------------------------
}

local opts = {}
require("lazy").setup(plugins, opts)
