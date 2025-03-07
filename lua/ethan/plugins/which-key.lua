return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require('which-key')

		wk.setup()

		-- Normal Mode Only
		wk.register({
			['<leader>'] = {
				d = {
					name = '[D]ebug',
				},
				s = {
					name = '[S]earch',
					f = '[S]earch [F]iles',
					k = '[S]earch [K]eymaps',
					g = '[S]earch Live [G]rep',
					c = '[S]earch [C]urrent String',
					h = '[S]earch [H]elp Tags',
				},
				['ws'] = '[W]indow [S]plit',
			},
			['<M-h>'] = 'Tmux Navigate Left',
			['<M-j>'] = 'Tmux Navigate Down',
			['<M-k>'] = 'Tmux Navigate Up',
			['<M-l>'] = 'Tmux Navigate Right',
			['<C-k>'] = 'Completion Select Previous Item',
			['<C-j>'] = 'Completion Select Next Item',
			['<C-b>'] = 'Completion Scroll Docs Down',
			['<C-f>'] = 'Completion Scroll Docs Up',
			['<C-Space>'] = 'Completion Complete',
			['<C-e>'] = 'Completion Abort',
			['<CR>'] = 'Completion Confirm',
		})

		-- Normal and Visual Mode Only
		wk.register({
			['<leader'] = {
				c = {
					name = '[C]omment',
					l = '[C]omment [L]ine',
					b = '[C]omment [B]lock',
				},
			},
		}, { mode = { 'n', 'v' } })
	end,
}
