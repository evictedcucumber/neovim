return {
	'kdheepak/lazygit.nvim',
	cmd = {
		'LazyGit',
		'LazyGitConfig',
		'LazyGitCurrentFile',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	keys = {
		{ '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Open Lazy[G]it UI' },
	},
	config = function()
		require('telescope').load_extension('lazygit')
	end,
}
