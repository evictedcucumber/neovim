local wk = require('which-key')

wk.register({
	['<leader>'] = {
		w = { '<cmd>w<cr>', '[W]rite Current Buffer' },
		x = { '<cmd>bd<cr>', 'Close Current Buffer' },
		['<tab>'] = { '<cmd>Explore<cr>', '[E]xplorer' },
	},
}, { mode = 'n' })
