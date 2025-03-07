local M = {}

M.setup = function()
	require('telescope').load_extension('lazygit')
end

return M
