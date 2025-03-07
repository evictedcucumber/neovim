return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag',
	},
	event = { 'BufReadPre', 'BufNewFile' },
	build = ':TSUpdate',
	lazy = false,
	config = require('ethan.config.nvim-treesitter').setup,
}
