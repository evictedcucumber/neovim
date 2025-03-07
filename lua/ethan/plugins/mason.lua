return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = require('ethan.plugins.opts.mason'),
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        lazy = false,
        opts = require('ethan.plugins.opts.mason-tool-installer'),
    },
}
