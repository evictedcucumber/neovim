return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
        {
            'm',
            function()
                require('flash').jump()
            end,
            mode = { 'n', 'o', 'x' },
            desc = 'Flash Jump',
        },
        {
            'M',
            function()
                require('flash').treesitter()
            end,
            mode = { 'n', 'o', 'x' },
            desc = 'Flash Treesitter',
        },
        {
            '<C-m>',
            function()
                require('flash').toggle()
            end,
            mode = { 'c' },
            desc = 'Flash Toggle',
        },
    },
}
