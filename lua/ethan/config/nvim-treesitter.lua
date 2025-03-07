local M = {}

M.setup = function()
	---@diagnostic disable-next-line: missing-fields
	require('nvim-treesitter.configs').setup({
		auto_install = true,
		sync_install = true,
		ignore_install = {},
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
end

return M
