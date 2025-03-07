return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('conform').setup({
			notify_on_error = false,
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				tex = { 'latexindent' },
				['*'] = { 'codespell' },
				['_'] = { 'trim_whitespace' },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
