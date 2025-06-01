return {
  -- TODO: https://github.com/rexim/org-cliplink/
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      -- TODO: missing from nix
      -- https://github.com/nvim-orgmode/org-bullets.nvim
      -- "nvim-orgmode/org-bullets.nvim",
      "lukas-reineke/headlines.nvim",
      "saghen/blink.cmp"
    },
    event = "VeryLazy",
    ft = { "org" },
    opts = function()
      require("orgmode").setup({
        org_agenda_files = "~/**/*",
        org_default_notes_file = "~/NOTES.org",
      })
      require("headlines").setup()
      require('blink.cmp').setup({
        sources = {
          per_filetype = {
            org = { 'orgmode' }
          },
          providers = {
            orgmode = {
              name = 'Orgmode',
              module = 'orgmode.org.autocompletion.blink',
              fallbacks = { 'buffer' },
            },
          },
        },
      })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
    },
    opts = function()
      require("org-roam").setup({
        directory = "~",
        bindings = {
          prefix = "<Leader>r",
        },
        extensions = {
          dailies = {
            directory = "inbox",
          },
        },
      })
    end,
  },
}
