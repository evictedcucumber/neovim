return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
        'hrsh7th/cmp-nvim-lsp',
        'j-hui/fidget.nvim',
        { 'folke/neodev.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
    },
    config = require('ethan.plugins.config.lspconfig'),
}
