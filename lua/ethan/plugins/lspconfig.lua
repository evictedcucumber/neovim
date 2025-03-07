return {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
        { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
        'hrsh7th/cmp-nvim-lsp',
        'j-hui/fidget.nvim',
        { 'folke/neodev.nvim', opts = {} },
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = require('ethan.plugins.config.lspconfig'),
}
