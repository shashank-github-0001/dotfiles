return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmakelang" },
      json = { "clang-format" },
      python = { "black" },
      go = { "gofmt" },
      html = { "prettier" },
    },
  },
}
