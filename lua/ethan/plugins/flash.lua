return {
    'folke/flash.nvim',
    keys = { { 'm' }, { 'M' }, { '<C-m>' } },
    config = function()
        local flash = require('flash')

        vim.keymap.set(
            { 'n', 'o', 'x' },
            'm',
            flash.jump,
            { noremap = true, silent = true, desc = 'Flash Jump' }
        )
        vim.keymap.set(
            { 'n', 'o', 'x' },
            'M',
            flash.treesitter,
            { noremap = true, silent = true, desc = 'Flash Treesitter' }
        )
        vim.keymap.set(
            { 'c' },
            '<C-m>',
            flash.toggle,
            { noremap = true, silent = true, desc = 'Flash Toggle' }
        )
    end,
}
