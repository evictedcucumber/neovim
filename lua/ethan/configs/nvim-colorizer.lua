local M = {}

M.setup = function()
    require('colorizer').setup({
        user_default_options = {
            mode = 'foreground',
            names = false,
        },
    })
end

return M
