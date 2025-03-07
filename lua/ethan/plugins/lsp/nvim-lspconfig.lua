return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        {
            'folke/trouble.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            opts = {},
        },
        'hrsh7th/cmp-nvim-lsp',
        { 'j-hui/fidget.nvim', config = require('ethan.configs.fidget').setup },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = require('ethan.configs.nvim-lspconfig').setup,
}
