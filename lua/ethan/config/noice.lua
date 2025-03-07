local M = {}

M.opts = {
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
}

return M
