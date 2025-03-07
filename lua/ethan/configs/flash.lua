local M = {}

M.setup = function()
    local flash = require('flash')

    flash.setup({})

    vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash Jump' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', flash.treesitter, { desc = 'Flash Treesitter Search' })
end

return M
