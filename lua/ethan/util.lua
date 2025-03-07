local M = {}

M.create_custom_augroup = function(name)
    return vim.api.nvim_create_augroup('ethan_augroup_' .. name, { clear = true })
end

return M
