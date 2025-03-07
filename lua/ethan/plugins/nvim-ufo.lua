return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
    },
    event = 'BufEnter',
    config = require('ethan.configs.nvim-ufo').setup,
}
