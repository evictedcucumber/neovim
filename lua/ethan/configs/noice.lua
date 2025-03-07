local M = {}

---@type NoiceConfig
M.opts = {
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
}

return M
