return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('oil').setup({
			default_file_explorer = true,
			columns = {
				'icon',
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return vim.tbl_contains({ '.git' }, name) or vim.endswith(name, 'cache')
				end,
			},
		})
	end,
}
