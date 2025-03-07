return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { max_lines = 5 },
    },
    build = ':TSUpdate',
    event = 'BufReadPost',
    opts = require('ethan.plugins.opts.treesitter'),
}
