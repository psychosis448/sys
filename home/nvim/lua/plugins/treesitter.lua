return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.auto_install = false
      opts.ensure_installed = {}
    end,
    -- opts = {
    -- 	auto_install = false,
    -- 	ensure_installed = {},
    -- },
  },
}
