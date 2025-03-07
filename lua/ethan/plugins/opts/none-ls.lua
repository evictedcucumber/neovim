return function()
    local nls = require('null-ls')
    local nls_helpers = require('null-ls.helpers')
    local nls_methods = require('null-ls.methods')

    local luacheck = nls_helpers.make_builtin({
        name = 'luacheck',
        meta = {
            url = 'https://github.com/lunarmodules/luacheck',
            description = 'A tool for linting and static analysis of Lua code.',
        },
        method = nls_methods.internal.DIAGNOSTICS,
        filetypes = { 'lua' },
        generator_opts = {
            command = 'luacheck',
            to_stdin = true,
            from_stderr = true,
            args = {
                '--formatter',
                'plain',
                '--codes',
                '--ranges',
                '--filename',
                '$FILENAME',
                '-',
            },
            format = 'line',
            on_output = nls_helpers.diagnostics.from_pattern(
                [[:(%d+):(%d+)-(%d+): %((%a)(%d+)%) (.*)]],
                { 'row', 'col', 'end_col', 'severity', 'code', 'message' },
                {
                    severities = {
                        E = nls_helpers.diagnostics.severities['error'],
                        W = nls_helpers.diagnostics.severities['warning'],
                    },
                    offsets = { end_col = 1 },
                }
            ),
        },
        factory = nls_helpers.generator_factory,
    })

    local python_executable = function()
        local path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX') or vim.fn.getcwd()
        path = path .. '/bin/python3'
        if vim.fn.filereadable(path) == 0 then
            path = '/usr/bin/python3'
        end
        return path
    end

    return {
        sources = {
            -- Formatters
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.isort,
            nls.builtins.formatting.black,
            nls.builtins.formatting.prettierd,
            -- Linters
            luacheck,
            nls.builtins.diagnostics.mypy.with({
                extra_args = {
                    '--python-executable',
                    python_executable(),
                },
            }),
            require('none-ls.diagnostics.eslint_d'),
        },
        on_attach = function(client, bufnr)
            if client.supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = require('ethan.util').create_custom_augroup('none_ls_formatting'),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    }
end
