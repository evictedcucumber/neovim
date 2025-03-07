return {
	'numToStr/Comment.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>cl',
				block = '<leader>cb',
			},
			opleader = {
				line = '<leader>cl',
				block = '<leader>cb',
			},
			mappings = {
				extra = false,
			},
		})

		require('which-key').register({
			['<leader>cl'] = '[C]omment [L]ine',
			['<leader>cb'] = '[C]omment [B]lock',
		}, { mode = { 'n', 'v' } })
	end,
}
