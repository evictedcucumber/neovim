return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    opts = require('ethan.configs.mason').opts,
    config = require('ethan.configs.mason').setup,
}
