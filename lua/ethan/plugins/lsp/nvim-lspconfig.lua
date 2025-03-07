return {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.8',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        {
            'folke/trouble.nvim',
            tag = 'v3.0.0',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            opts = {},
        },
        'hrsh7th/cmp-nvim-lsp',
        { 'j-hui/fidget.nvim', tag = 'v1.4.5', config = require('ethan.configs.fidget').setup },
        { 'folke/neodev.nvim', tag = 'v2.5.2', opts = {} },
    },
    config = require('ethan.configs.nvim-lspconfig').setup,
}
