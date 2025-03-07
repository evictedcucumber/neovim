return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = true },
		'hrsh7th/cmp-nvim-lsp',
		{ 'folke/neodev.nvim', config = true },
		{
			'j-hui/fidget.nvim',
			opts = require('ethan.config.lsp-config').fidget_opts,
		},
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = require('ethan.config.lsp-config').setup,
}
