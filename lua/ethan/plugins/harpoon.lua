return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependecies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local harpoon = require('harpoon')

		harpoon:setup()

		require('which-key').register({
			['<leader>'] = {
				a = {
					function()
						harpoon:list():append()
					end,
					'[A]ppend to Harpoon',
				},
				e = {
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					'Harpoon [E]xplorer',
				},
			},
			['<C-P>'] = {
				function()
					harpoon:list():prev()
				end,
				'Goto [P]revious Harpoon Item',
			},
			['<C-N>'] = {
				function()
					harpoon:list():next()
				end,
				'Goto [N]ext Harpoon Item',
			},
		}, { mode = 'n' })

		vim.keymap.set('n', '<C-h>', function()
			harpoon:list():select(1)
		end)
		vim.keymap.set('n', '<C-j>', function()
			harpoon:list():select(2)
		end)
		vim.keymap.set('n', '<C-k>', function()
			harpoon:list():select(3)
		end)
		vim.keymap.set('n', '<C-l>', function()
			harpoon:list():select(4)
		end)
	end,
}
