return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = require('ethan.config.colourscheme').opts,
	config = require('ethan.config.colourscheme').setup,
}
