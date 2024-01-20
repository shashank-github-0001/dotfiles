vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.expandtab      = true
vim.opt.swapfile       = false
vim.opt.clipboard      = "unnamedplus"
vim.opt.smartindent    = true
vim.opt.wrap           = false
vim.opt.undofile       = true
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.scrolloff      = 8
vim.opt.signcolumn     = "yes"
vim.opt.cursorline     = true
vim.g.mapleader        = " "
vim.g.maplocalleader   = " "
vim.opt.updatetime     = 50
vim.opt.colorcolumn    = "1000"
vim.opt.termguicolors  = true
vim.opt.guicursor  = "a:block-blinkon0"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
        "Exafunction/codeium.vim",
        event = "BufEnter"
    },
    ---------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    ---------------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.5',
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
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
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
    },
    ---------------------------------------------------------------------
    { "EdenEast/nightfox.nvim" },
    ---------------------------------------------------------------------
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    ---------------------------------------------------------------------
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
    ---------------------------------------------------------------------
}
require("lazy").setup(plugins, opts)



--configure all the plugins
--colorscheme
vim.cmd("colorscheme carbonfox")


--treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "dart", "cpp", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
   },
})


--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--lsp
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer","clangd" ,"pyright" ,"tsserver" ,"lua_ls", "jdtls", "jsonls", "ocamllsp"},
})
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.jdtls.setup({ capabilities = capabilities })
lspconfig.ocamllsp.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.dartls.setup({ capabilities = capabilities })


--the tree shit
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    }
  }
})

vim.keymap.set("n", "<leader>dir", ":NvimTreeToggle<CR>")


--lualine
require('lualine').setup()
