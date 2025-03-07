return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})

		require('mason-lspconfig').setup({
			ensure_installed = {
				'lua_ls',
				'pyright',
			},
		})

		require('mason-tool-installer').setup({
			ensure_installed = {
				'codespell',
				'stylua',
				'luacheck',
				'isort',
				'black',
				'mypy',
				'ruff',
			},
		})
	end,
}
