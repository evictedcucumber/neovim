return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = 'VimEnter',
    config = require('ethan.plugins.config.harpoon'),
}
