local M = {}

M.init = function()
	vim.g['tex_flavor'] = 'latex'
	vim.g['vimtex_format_enabled'] = 1
	vim.g['vimtex_context_pdf_viewer'] = 'okular'
	vim.g['vimtex_compiler_latexmk_engines'] = {
		['_'] = '-pdf',
	}
	vim.g['vimtex_quickfix_mode'] = 0
	vim.g['vimtex_indent_enabled'] = 0
	vim.g['tex_indent_items'] = 0
	vim.g['tex_indent_brace'] = 0
	vim.g['vimtex_log_ignore'] = {
		'Underfull',
		'Overfull',
		'specifier changed to',
		'Token not allowed in a PDF string',
	}
end

return M
