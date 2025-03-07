return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },
		'hrsh7th/cmp-nvim-lsp',
		{ 'folke/neodev.nvim', opts = {} },
		{ 'j-hui/fidget.nvim', opts = {} },
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('EthanLspConfig', {}),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc, buffer = event.buf, silent = true })
				end

				local trouble = require('trouble')
				local telescope = require('telescope.builtin')

				map('gd', function()
					trouble.toggle('lsp_definitions')
				end, '[G]oto [D]efinition')

				map('gr', function()
					trouble.toggle('lsp_references')
				end, '[G]oto [R]eferences')

				map('gi', telescope.lsp_implementations, '[G]oto [I]mplementation')

				map('gt', function()
					trouble.toggle('lsp_type_definitions')
				end, 'Type [D]efinition')

				map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')

				map('<leader>wS', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

				map('K', vim.lsp.buf.hover, 'Hover Documentation')

				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				map('<leader>xx', function()
					trouble.toggle()
				end, 'Toggle Trouble')

				map('<leader>xq', function()
					trouble.toggle('quickfix')
				end, 'Toggle [Q]uickfix List')

				map('<leader>xl', function()
					trouble.toggle('loclist')
				end, 'Toggle [L]ocation List')

				map('<leader>xw', function()
					trouble.toggle('workspace_diagnostics')
				end, 'Toggle [W]orkspace Diagnostics')

				map('<leader>xd', function()
					trouble.toggle('document_diagnostics')
				end, 'Toggle [D]ocument Diagnostics')

				map('[d', vim.diagnostic.goto_prev, 'Goto Previous [D]iagnostic Message')

				map(']d', vim.diagnostic.goto_next, 'Goto Next [D]iagnostic Message')

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
		end

		local servers = {
			lua_ls = {
				filetypes = { 'lua' },
				Lua = {
					diagnostics = {
						globals = { 'vim' },
						disable = { 'missing-fields' },
					},
					workspace = {
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.stdpath('config') .. '/lua'] = true,
						},
					},
					completion = {
						callSnippet = 'Replace',
					},
				},
			},
			pyright = {
				filetypes = { 'python' },
			},
			texlab = {
				filetypes = { 'tex' },
			},
		}

		require('mason').setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua',
			'luacheck',
			'isort',
			'black',
			'mypy',
			'ruff',
		})

		require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

		require('mason-lspconfig').setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}

					server.capabilities = vim.tbl_deep_extend('force', capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			underline = true,
		})
	end,
}
