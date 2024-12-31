-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

-- NEOGIT
-- set keymaps for neogit
map("n", "<leader>gn", vim.cmd.Neogit, { desc = "Neogit (Root Dir)" })

-- yank to the system clipboard
map({ "n", "v" }, "<leader>yy", [["+y]], { desc = "Yank to the system clipboard" })

-- TODO: integrate old keymaps
-- -- NORMAL MODE
--  open tools
-- map('n', '<leader>ng', vim.cmd.Neogit, opts 'Open Neogit')
-- map('n', '<leader>zm', vim.cmd.ZenMode, opts 'Start ZenMode')
-- map('n', '<leader>ft', vim.cmd.TodoTelescope, opts 'Find TODOs')
-- map('n', '<leader>pl', [[<cmd>lua require("persistence").load()<cr>]], opts 'Load last session')
-- --  buffer management
-- map('n', '<leader>bp', vim.cmd.bnext, opts 'Switch to next buffer')
-- map('n', '<leader>bn', vim.cmd.bprevious, opts 'Switch to previous buffer')
-- -- window stuff
-- map('n', '<C-w><', '10<C-w><', opts '')
-- map('n', '<C-w>>', '10<C-w>>', opts '')
-- map('n', '<C-w>+', '5<C-w>+', opts '')
-- map('n', '<C-w>-', '5<C-w>-', opts '')
--
-- -- cursor control
-- map('n', 'J', 'mzJ`z', opts 'Cursor stays at current line')
-- map('n', '<C-d>', '<C-d>zz', opts 'Cursor stays in the middle when half page jumping')
-- map('n', '<C-u>', '<C-u>zz', opts 'Cursor stays in the middle when half page jumping')
-- map('n', 'n', 'nzzzv', opts 'Search terms stay in the middle')
-- map('n', 'N', 'Nzzzv', opts 'Search terms stay in the middle')
-- -- quick fix navigation
-- -- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- -- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- -- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- -- map("n", "<leader>j", "<cmd>lprev<CR>zz")
-- --
-- map('n', 'Q', '<nop>', opts 'Disable killing buffers')
-- map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts 'Replace word under cursor')
-- --
-- -- VISUAL MODE
-- map('v', 'J', ":m '>+1<CR>gv=gv", opts 'Move selected text down')
-- map('v', 'K', ":m '<-2<CR>gv=gv", opts 'Move selected text up')
-- map('v', '>', '>gv', opts 'Stay in indent mode')
-- map('v', '<', '<gv', opts 'Stay in indent mode')
-- -- register control
-- map('v', 'p', [["_dP]], opts 'Paste over selected text without yanking it')
-- map('n', 'c', [["_c]], opts 'Change selected text without yanking it')
-- map({ 'n', 'v' }, '<leader>yy', [["+y]], opts 'Yank to the system clipboard')
-- -- TODO     pasting from system clipboard does not work!
-- map({ 'n', 'v' }, '<leader>pp', [["+p]])
-- map('n', '<leader>Y', [["+Y]], opts 'Yank from cursor until end of line')
-- map({ 'n', 'v' }, '<leader>d', [["_d]], opts 'Delete without yanking')
--
