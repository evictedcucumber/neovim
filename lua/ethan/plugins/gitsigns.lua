return {
    'lewis6991/gitsigns.nvim',
    event = 'User FilePost',
    opts = require('ethan.configs.gitsigns').opts,
    config = require('ethan.configs.gitsigns').setup,
}
