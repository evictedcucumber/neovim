return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		routes = {
			{
				filter = { event = 'notify', find = 'No information available' },
				opts = { skip = true },
			},
		},
		presets = {
			lsp_doc_border = true,
		},
		notify = {
			enabled = true,
			view = 'notify',
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
	},
	dependencies = {
		'MunifTanjim/nui.nvim',
		{
			'rcarriga/nvim-notify',
			config = function()
				require('notify').setup({
					background_colour = '#000000',
				})
			end,
		},
	},
}
