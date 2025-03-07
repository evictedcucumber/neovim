return {
    'mfussenegger/nvim-lint',
    event = 'BufReadPost',
    config = require('ethan.plugins.config.lint'),
}
