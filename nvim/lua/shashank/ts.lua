require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "cpp", "rust",  "java" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
