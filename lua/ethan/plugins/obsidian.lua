return {
	'epwalsh/obsidian.nvim',
	version = 'v3.7.10',
	lazy = true,
	event = {
		'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/obsidian-vaults/**.md',
		'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/obsidian-vaults/**.md',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = require('ethan.config.obsidian').opts,
}
