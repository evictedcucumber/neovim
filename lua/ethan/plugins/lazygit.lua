return {
	'kdheepak/lazygit.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		require('telescope').load_extension('lazygit')

		require('which-key').register({
			['<leader>gg'] = { '<cmd>LazyGit<cr>', 'Lazy[G]it', mode = 'n' },
		})
	end,
}
