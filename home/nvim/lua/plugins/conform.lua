return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    event = { "BufWritePre" },
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      nix = { "alejandra" },
      ["markdown"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
      ["markdown.mdx"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
    },
  },
}
