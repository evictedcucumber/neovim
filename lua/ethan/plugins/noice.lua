return {
    'folke/noice.nvim',
    tag = 'v4.0.0',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
    config = require('ethan.configs.noice').setup,
}
