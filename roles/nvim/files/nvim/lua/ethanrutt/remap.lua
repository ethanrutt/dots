vim.g.mapleader = ' '

-------------------------------------------------------------------------------
-- Keymaps for better default experience
-------------------------------------------------------------------------------
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move lines up and down while highlighting them with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When squashing lines, keep cursor at beginning
vim.keymap.set("n", "J", "mzJ`z")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set('n', '<leader>sx', vim.cmd.Ex, { desc = '[S]earch with :E[x] (netrw)' })

-- while highlighting and pasting, don't yank into register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[p]aste without yanking"})

-- yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "[y]ank into system clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank into system clipboard"})

-- delete into void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "[d]elete into void register"})

-- don't cancel me, I have this for 3 reasons
-- 1. when going into visual block mode, then insert mode, if you C-c, the
--    insert doesn't apply to all lines
-- 2. when hitting C-c in normal mode, in the cmd line it tells you to use :qa!
--    to exit vim every single time, which is annoying
-- 3. nvim guru ThePrimeagen has it :P
vim.keymap.set({"n", "v"}, "<C-c>", "<Esc>")

-------------------------------------------------------------------------------
-- Quickfix List
-------------------------------------------------------------------------------
vim.keymap.set('n', '<Space>co', vim.cmd.copen, { desc = 'Open quickfix list window'})
vim.keymap.set('n', '<Space>cl', vim.cmd.ccl, { desc = 'Close quickfix list window'})
vim.keymap.set('n', '<Space>cn', "<cmd>cnext<CR>zz", { desc = 'Go to next item'})
vim.keymap.set('n', '<Space>cp', "<cmd>cprev<CR>zz", { desc = 'Go to previous item'})

-------------------------------------------------------------------------------
-- Diagnostic keymaps
-------------------------------------------------------------------------------
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-------------------------------------------------------------------------------
-- Keep cursor in the middle when jumping
-------------------------------------------------------------------------------
-- forward and backwards search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- half page and full page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

