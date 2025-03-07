return function()
    local null_ls = require('null-ls')

    return {
        sources = {
            -- Formatters
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.prettierd,
            require('none-ls.formatting.trim_whitespace'),
            -- Linters
            null_ls.builtins.diagnostics.mypy.with({
                extra_args = {
                    '--python-executable',
                    (function()
                        local path = os.getenv('VIRTUAL_ENV')
                            or os.getenv('CONDA_PREFIX')
                            or vim.fn.getcwd()
                        path = path .. '/bin/python3'
                        if vim.fn.filereadable(path) == 0 then
                            path = '/usr/bin/python3'
                        end
                        return path
                    end)(),
                },
            }),
            require('none-ls-luacheck.diagnostics.luacheck'),
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
