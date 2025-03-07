local M = {}

M.opts = {
	options = {
		icons_enabled = true,
		theme = 'auto',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'diagnostic' },
		lualine_y = { 'filetype' },
		lualine_z = { 'location' },
	},
}

return M
