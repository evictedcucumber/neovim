return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local lint = require('lint')

		lint.linters_by_ft = {
			lua = { 'luacheck' },
			python = { 'mypy' },
		}

		lint.linters.cspell = require('lint.util').wrap(lint.linters.cspell, function(diagnostic)
			diagnostic.severity = vim.diagnostic.severity.HINT
			return diagnostic
		end)

		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
				lint.try_lint('cspell')
			end,
		})
	end,
}
