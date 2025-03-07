return {
    'epwalsh/obsidian.nvim',
    lazy = true,
    event = {
        'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/obsidian-vaults/**.md',
        'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/obsidian-vaults/**.md',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = require('ethan.configs.obsidian').setup,
}
