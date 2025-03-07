return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'debugloop/telescope-undo.nvim',
    },
    event = 'VimEnter',
    config = require('ethan.plugins.config.telescope'),
}
