return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag',
	},
	event = { 'BufReadPre', 'BufNewFile' },
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			auto_install = true,
			ensure_installed = {
				'lua',
				'python',
				'markdown',
				'markdown_inline',
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = false,
					node_decremental = '<bs>',
				},
			},
		})
	end,
}
