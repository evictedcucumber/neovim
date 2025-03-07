return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = require('ethan.config.nvim-lint').setup,
}
