return function()
    local lint = require('lint')

    lint.linters_by_ft = {
        lua = { 'luacheck' },
        python = { 'mypy', 'ruff' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        css = { 'stylelint' },
    }

    lint.linters.mypy.extra_args = {
        '--python-executable',
        function()
            local path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX') or vim.fn.getcwd()
            path = path .. '/bin/python3'
            if vim.fn.filereadable(path) == 0 then
                path = '/usr/bin/python3'
            end
            return path
        end,
    }

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'BufNewFile', 'InsertLeave' }, {
        group = require('ethan.util').create_custom_augroup('linter'),
        callback = function()
            lint.try_lint()
        end,
    })
end
