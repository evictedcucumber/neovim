return {
	'numToStr/Comment.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = require('ethan.config.comment').opts,
}
