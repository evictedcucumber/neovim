vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader><tab>', '<cmd>Oil<CR>', { desc = 'Open Oil' })

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<ESC>')

vim.keymap.set('n', '<leader>wsv', '<C-w>v', { desc = '[W]indow [S]plit [V]ertial' })
vim.keymap.set('n', '<leader>wsh', '<C-w>s', { desc = '[W]indow [S]plit [H]orizontal' })
vim.keymap.set('n', '<leader>wsx', '<cmd>close<CR>', { desc = '[W]indow [S]plit Close' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = '[P]aste from Clipboard' })

vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv<CR>")
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv<CR>")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'Q', '<nop>')
