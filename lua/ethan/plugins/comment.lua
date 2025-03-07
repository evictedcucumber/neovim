return {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = require('ethan.configs.comment').opts,
}
