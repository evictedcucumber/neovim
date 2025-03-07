return {
    'folke/flash.nvim',
    keys = { { '<leader>f' }, { '<leader>F' }, { '<C-f>' } },
    config = function()
        local flash = require('flash')

        vim.keymap.set(
            { 'n', 'o', 'x' },
            '<leader>f',
            flash.jump,
            { noremap = true, silent = true, desc = 'Flash Jump' }
        )
        vim.keymap.set(
            { 'n', 'o', 'x' },
            '<leader>F',
            flash.treesitter,
            { noremap = true, silent = true, desc = 'Flash Treesitter' }
        )
        vim.keymap.set(
            { 'c' },
            '<C-f>',
            flash.toggle,
            { noremap = true, silent = true, desc = 'Flash Toggle' }
        )
    end,
}
