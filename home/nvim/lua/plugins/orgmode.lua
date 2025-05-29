return {
  {
    "nvim-orgmode/orgmode",
    event = 'VeryLazy',
    ft = { 'org' },
    opts = function()
      require('orgmode').setup({
        org_agenda_files = '~/org/**/*',
        org_default_notes_file = '~/org/notes.org',
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
        directory = "~/org",
        bindings = {
          prefix = "<Leader>r",
        },
        extensions = {
          dailies = {
            directory = "0-inbox",
          },
        },
      })
    end,
  }
}
