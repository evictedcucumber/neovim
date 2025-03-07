local M = {}

M.setup = function()
    local flash = require('flash')

    flash.setup({})

    require('which-key').register({
        s = { flash.jump, 'Flash Jump' },
        S = { flash.treesitter, 'Flash Treesitter' },
    }, { mode = { 'n', 'x', 'o' } })
end

return M
