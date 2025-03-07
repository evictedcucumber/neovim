return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-copilot',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    },
    config = require('ethan.configs.nvim-cmp').setup,
}
