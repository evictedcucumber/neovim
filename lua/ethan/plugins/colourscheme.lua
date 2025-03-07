return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    init = require('ethan.plugins.init.colourscheme'),
    opts = require('ethan.plugins.opts.colourscheme'),
}
