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
