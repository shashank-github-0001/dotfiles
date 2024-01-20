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
require("lazy").setup({
    {"EdenEast/nightfox.nvim"},
    {'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
    {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"},
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip'},
    {"Exafunction/codeium.nvim"},
    {'numToStr/Comment.nvim', opts = {}, lazy = false},
    {"nvim-telescope/telescope.nvim", tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' }},
    {"nvim-tree/nvim-tree.lua"},
    {"Exafunction/codeium.nvim", dependencies = {"nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp"}, config = function() require("codeium").setup({}) end },
    {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
})

vim.opt.compatible     = false
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.termguicolors  = true
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
vim.cmd("colorscheme carbonfox")


--lualine
require('lualine').setup({
    icone_enabled  = true,
})


--treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "cpp", "rust", "typescript", "bash", "java", "json", "markdown", "ocaml" ,"python", "dart"},
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
}

--mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

--mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "rust_analyzer", "bashls", "clangd", "emmet_language_server", "jdtls", "jsonls", "marksman", "ocamllsp", "pyright", "tsserver"}
})


--cmp
local cmp = require("cmp");
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
    sources = cmp.config.sources({{ name = 'nvim_lsp' }, { name = 'luasnip' }},  {{ name = 'buffer' }})})
    cmp.setup.filetype('gitcommit', {sources = cmp.config.sources({{ name = 'git' }}, {{ name = 'buffer' }})})
    cmp.setup.cmdline({ '/', '?' }, {mapping = cmp.mapping.preset.cmdline(), sources = {{ name = 'buffer' }}})
    cmp.setup.cmdline(':', {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})})


    --lsp servers
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')

    lspconfig.rust_analyzer.setup {
        capabilities = capabilities
    }
    lspconfig.bashls.setup {
        capabilities = capabilities
    }
    lspconfig.clangd.setup {
        capabilities = capabilities
    }
    lspconfig.emmet_language_server.setup {
        capabilities = capabilities
    }
    lspconfig.jdtls.setup {
        capabilities = capabilities
    }
    lspconfig.jsonls.setup {
        capabilities = capabilities
    }
    lspconfig.lua_ls.setup {
        capabilities = capabilities
    }
    lspconfig.marksman.setup {
        capabilities = capabilities
    }
    lspconfig.ocamllsp.setup {
        capabilities = capabilities
    }
    lspconfig.pyright.setup {
        capabilities = capabilities
    }
    lspconfig.tsserver.setup {
        capabilities = capabilities
    }
    lspconfig.dartls.setup {
        capabilities = capabilities
    }

    --remaps
    vim.keymap.set('n', '<leader>dir', ':Ex<CR>');
    vim.keymap.set('n', '<leader>la', ':Lazy<CR>');
    vim.keymap.set('n', '<leader>m', ':Mason<CR>');
    vim.keymap.set('n', '<C-b>', '<C-b>zz<CR>');
    vim.keymap.set('n', '<C-f>', '<C-f>zz<CR>');
    vim.keymap.set('n', '<leader>ch', ':CheckHealth<CR>');

    --telescope 
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {})


    --tree
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
            dotfiles = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
                resize_window = true,
            }
        }
    })
    vim.keymap.set('n', '<leader>dir', ':NvimTreeToggle<CR>', {})
