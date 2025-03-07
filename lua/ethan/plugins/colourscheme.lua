return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = require('ethan.configs.colourscheme').opts,
    config = require('ethan.configs.colourscheme').setup,
}
