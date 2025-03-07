vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader><tab>', '<cmd>Oil<CR>', { desc = 'Open Oil' })

vim.keymap.set('n', '<leader>wsv', '<C-w>v', { desc = '[W]indow [S]plit [V]ertial' })
vim.keymap.set('n', '<leader>wsh', '<C-w>s', { desc = '[W]indow [S]plit [H]orizontal' })
vim.keymap.set('n', '<leader>wsx', '<cmd>close<CR>', { desc = '[W]indow [S]plit Close' })
