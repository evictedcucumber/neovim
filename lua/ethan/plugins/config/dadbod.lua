return function()
    vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/db_ui'

    local augroup = require('ethan.util').create_custom_augroup('dadbod_completion')

    vim.api.nvim_create_autocmd('FileType', {
        group = augroup,
        pattern = {
            'sql',
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = augroup,
        pattern = {
            'sql',
            'mysql',
            'plsql',
        },
        callback = function()
            vim.schedule(function()
                require('cmp').setup.buffer({
                    sources = { { name = 'vim-dadbod-completion' } },
                })
            end)
        end,
    })
end
