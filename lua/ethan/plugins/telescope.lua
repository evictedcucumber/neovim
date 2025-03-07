return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
		require('which-key').register({
			['<leader>'] = {
				s = {
					f = { builtin.find_files, '[S]earch [F]iles' },
					k = { builtin.keymaps, '[S]earch [K]eymaps' },
					g = { builtin.live_grep, 'Live [G]rep' },
					c = { builtin.grep_string, 'String Under [C]ursor' },
				},
			},
		}, { mode = 'n' })
	end,
	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.actions')

		telescope.setup({
			defaults = {
				layout_strategy = 'horizontal',
				layout_config = {
					horizontal = { width = 0.9 },
				},
				mappings = {
					i = {
						['<C-k>'] = actions.move_selection_previous,
						['<C-j>'] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		telescope.load_extension('fzf')

	end,
}
