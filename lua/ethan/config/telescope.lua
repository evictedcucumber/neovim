local M = {}

M.setup = function()
	local telescope = require('telescope')
	local actions = require('telescope.actions')
	local transform_mod = require('telescope.actions.mt').transform_mod

	local trouble = require('trouble')
	local trouble_telescope = require('trouble.providers.telescope')

	local custom_actions = transform_mod({
		open_trouble_qflist = function()
			trouble.toggle('quickfix')
		end,
	})

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
					['<C-q>'] = actions.send_selected_to_qflist
						+ custom_actions.open_trouble_qflist,
					['<C-t>'] = trouble_telescope.smart_open_with_trouble,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		extensions = {
			['ui-select'] = {
				require('telescope.themes').get_dropdown(),
			},
		},
		file_ignore_patterns = { '.git/', '.trash' },
	})

	telescope.load_extension('fzf')
	telescope.load_extension('ui-select')

	local builtin = require('telescope.builtin')

	vim.keymap.set('n', '<leader>sf', builtin.find_files)
	vim.keymap.set('n', '<leader>sk', builtin.keymaps)
	vim.keymap.set('n', '<leader>sg', builtin.live_grep)
	vim.keymap.set('n', '<leader>sc', builtin.grep_string)
	vim.keymap.set('n', '<leader>sh', builtin.help_tags)
end

return M
