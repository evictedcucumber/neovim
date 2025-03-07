return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-neotest/neotest-python',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = require('ethan.plugins.config.neotest'),
}
