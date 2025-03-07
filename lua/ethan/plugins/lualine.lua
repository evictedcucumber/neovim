return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local lazy_status = require('lazy.status') -- to configure lazy pending updates count
		require('lualine').setup({
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
				lualine_z = {
					'location',
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
				},
			},
		})
	end,
}
