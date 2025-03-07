return {
    'williamboman/mason.nvim',
    dependencies = {
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            opts = require('ethan.plugins.opts.mason-tool-installer'),
        },
    },
    lazy = false,
    opts = require('ethan.plugins.opts.mason'),
}
