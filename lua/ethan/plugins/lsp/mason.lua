return {
    'williamboman/mason.nvim',
    tag = 'v1.10.0',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim', tag = 'v1.29.0' },
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = require('ethan.configs.mason').setup,
}
