-- LazyVim plugins configuration
-- requires the plugins to be installed by nix in nvim/default.nix
return {
  -- COLORSCHEME
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  -- WARNING: never enable with nix
  -- MASON
  { "mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },

  -- UI
  -- bufferline.nvim
  { "akinsho/bufferline.nvim", enabled = false },
}
