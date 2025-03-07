return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSinstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    config = require('ethan.configs.nvim-treesitter').setup,
}
