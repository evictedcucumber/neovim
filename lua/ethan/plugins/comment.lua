return {
	'numToStr/Comment.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local comment = require('Comment')

		comment.setup({
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
	end,
}
