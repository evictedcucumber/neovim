return {
    'mfussenegger/nvim-dap',
    dependencies = {
        { 'nvim-neotest/nvim-nio', tag = 'v1.9.3' },
        { 'rcarriga/nvim-dap-ui', tag = 'v4.0.0' },
        { 'williamboman/mason.nvim', tag = 'v1.10.0' },
        { 'jay-babu/mason-nvim-dap.nvim', tag = 'v2.2.2' },
    },
    config = require('ethan.configs.debug').setup,
}
