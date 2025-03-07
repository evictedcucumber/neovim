return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = require('ethan.configs.nvim-lint').setup,
}
