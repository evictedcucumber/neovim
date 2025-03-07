return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    -- stylua: ignore
    keys = {
        { 's', function() require('flash').jump() end, mode = { 'n', 'o', 'x' }, desc = 'Flash Jump', },
        { 'S', function() require('flash').treesitter() end, mode = { 'n', 'o', 'x' }, desc = 'Flash Treesitter', },
        { '<C-s>', function() require('flash').toggle() end, mode = { 'c' }, desc = 'Flash Toggle', },
    },
}
