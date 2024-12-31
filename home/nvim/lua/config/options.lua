-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.ttimeoutlen = 0
opt.colorcolumn = "80"

-- LazyVim options
vim.g.lazyvim_picker = "fzf"
