return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{ 'folke/neodev.nvim', opts = {} },
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	config = function()
		local mason_lspconfig = require('mason-lspconfig')

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('EthanLspConfig', {}),
			callback = function(event)
				vim.keymap.set(
					'n',
					'gR',
					'<cmd>Telescope lsp_references<CR>',
					{ desc = 'Show LSP References', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'gD',
					vim.lsp.buf.declaration,
					{ desc = 'Goto Delcaration', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'gd',
					'<cmd>Telescope lsp_definitions<CR>',
					{ desc = 'Show LSP Definitions', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'gi',
					'<cmd>Telescope lsp_implementations<CR>',
					{ desc = 'Show LSP Implementations', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'gt',
					'<cmd>Telescope lsp_type_definitions<CR>',
					{ desc = 'Show LSP Type Definitions', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					{ 'n', 'v' },
					'<leader>ca',
					vim.lsp.buf.code_action,
					{ desc = 'View [C]ode [A]ctions', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'<leader>rn',
					vim.lsp.buf.rename,
					{ desc = '[R]e[n]ame', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'<leader>D',
					'<cmd>Telescope diagnostics bufnr=0<CR>',
					{ desc = 'View Buffer [D]iagnostics', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'<leader>d',
					vim.diagnostic.open_float,
					{ desc = 'View Line [D]iagnostics', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'[d',
					vim.diagnostic.goto_prev,
					{ desc = 'Previous [D]iagnostic', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					']d',
					vim.diagnostic.goto_next,
					{ desc = 'Next [D]iagnostic', buffer = event.buf, silent = true }
				)

				vim.keymap.set(
					'n',
					'K',
					vim.lsp.buf.hover,
					{ desc = 'View Documentation', buffer = event.buf, silent = true }
				)

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
		}

		mason_lspconfig.setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}

				server.capabilities = vim.tbl_deep_extend('force', capabilities, server.capabilities or {})
				require('lspconfig')[server_name].setup(server)
			end,
		})
	end,
}
