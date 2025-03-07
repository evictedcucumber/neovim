vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<ESC>')

vim.keymap.set('n', '<leader>wsv', '<C-w>v', { desc = 'Window Split Vertial' })
vim.keymap.set('n', '<leader>wsh', '<C-w>s', { desc = 'Window Split Horizontal' })
vim.keymap.set('n', '<leader>wsx', '<cmd>close<CR>', { desc = 'Window Split Close' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from Clipboard' })

vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv<CR>")
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv<CR>")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'Q', '<nop>')
