return {
    'kevinhwang91/nvim-ufo',
    tag = 'v1.4.0',
    dependencies = {
        'kevinhwang91/promise-async',
        tag = 'v1.0.0',
    },
    event = 'BufEnter',
    config = require('ethan.configs.nvim-ufo').setup,
}
