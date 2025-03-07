return {
	'stevearc/conform.nvim',
	dependencies = {
		'williamboman/mason.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require('conform')

		conform.setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'black', 'isort' },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
