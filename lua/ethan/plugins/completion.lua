return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    },
    config = require('ethan.plugins.config.completion'),
}
