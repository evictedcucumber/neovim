return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-context',
            opts = { max_lines = 5 },
        },
    },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = require('ethan.plugins.opts.treesitter'),
}
