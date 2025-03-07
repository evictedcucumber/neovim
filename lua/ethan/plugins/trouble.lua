return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>tt', '<cmd>TroubleToggle<CR>' },
		{ '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<CR>' },
		{ '<leader>td', '<cmd>TroubleToggle document_diagnostics<CR>' },
		{ '<leader>tq', '<cmd>TroubleToggle quickfix<CR>' },
		{ '<leader>tl', '<cmd>TroubleToggle loclist<CR>' },
	},
}
