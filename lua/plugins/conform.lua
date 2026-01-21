-- Conform configuration for formatting
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      dart = { "dart_format" },
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
    },
    formatters = {
      dart_format = {
        timeout_ms = 3000,
      },
    },
  },
}
