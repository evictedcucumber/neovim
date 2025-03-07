return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            lua = { 'luacheck' },
        }

        vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost' }, {
            group = require('ethan.util').create_custom_augroup('linting'),
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
