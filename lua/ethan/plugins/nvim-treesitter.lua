return {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.2',
    dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSinstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    config = require('ethan.configs.nvim-treesitter').setup,
}
