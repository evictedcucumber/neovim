return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = require('ethan.plugins.opts.conform'),
}
