return function()
    local lint = require('lint')

    lint.linters_by_ft = {
        lua = { 'luacheck' },
        python = { 'mypy' },
        css = { 'stylelint' },
        json = { 'biomejs' },
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = require('ethan.util').create_custom_augroup('lint'),
        callback = function()
            lint.try_lint()
        end,
    })

    lint.linters.mypy.args = {
        '--python-executable',
        function()
            local path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX') or '/usr'
            return path .. '/bin/python3'
        end,
    }
end
