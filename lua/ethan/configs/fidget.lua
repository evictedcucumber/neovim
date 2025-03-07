local M = {}

M.setup = function()
    require('fidget').setup({
        notification = {
            window = {
                winblend = 0,
            },
        },
    })
end

return M
