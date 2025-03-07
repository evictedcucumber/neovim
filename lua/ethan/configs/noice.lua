local M = {}

M.setup = function()
    require('noice').setup({
        cmdline = {
            enabled = true,
            view = 'cmdline',
        },
        routes = {
            {
                filter = { event = 'notify', find = 'No information available' },
                opts = { skip = true },
            },
        },
        notify = {
            enabled = true,
            view = 'mini',
        },
        lsp = {
            progress = {
                enabled = false,
            },
            hover = {
                enabled = true,
                silent = true,
            },
            message = {
                enabled = false,
            },
        },
        messages = {
            enabled = true,
            view = 'mini',
            view_error = 'mini',
            view_warn = 'mini',
        },
    })
end

return M
