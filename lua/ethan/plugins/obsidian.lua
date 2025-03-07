return {
    'epwalsh/obsidian.nvim',
    event = { 'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/obsidian-vaults/**.md' },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = require('ethan.plugins.opts.obsidian'),
}
