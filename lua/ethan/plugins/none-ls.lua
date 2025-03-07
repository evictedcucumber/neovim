return {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvimtools/none-ls-extras.nvim' },
    event = 'VeryLazy',
    main = 'null-ls',
    opts = require('ethan.plugins.opts.none-ls'),
}
