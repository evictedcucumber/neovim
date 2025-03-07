vim.g.mapleader = ' '

local set = vim.keymap.set

set('n', '<leader>w', '<cmd> w <CR>', { desc = 'Write current buffer' })
set('n', '<leader>x', '<cmd> bd <CR>', { desc = 'Close current buffer' })
set('n', '<leader>hc', '<cmd> nohlsearch <CR>', { desc = 'Remove search highlighting' })
