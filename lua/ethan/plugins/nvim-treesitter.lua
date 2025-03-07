return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSinstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    opts = require('ethan.configs.nvim-treesitter').opts,
    config = require('ethan.configs.nvim-treesitter').setup,
}
