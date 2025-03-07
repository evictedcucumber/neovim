return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		{ 'j-hui/fidget.nvim', opts = {} },
		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			dependencies = {
				'L3MON4D3/LuaSnip',
				'rafamadriz/friendly-snippets',
				'saadparwaiz1/cmp_luasnip',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'onsails/lspkind.nvim',
			},
			config = function()
				local cmp = require('cmp')
				local luasnip = require('luasnip')

				require('luasnip.loaders.from_vscode').lazy_load()
				require('luasnip.loaders.from_snipmate').lazy_load()

				cmp.setup({
					completion = {
						completeopt = 'menu,menuone,noselect',
					},
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					window = {
						completion = {
							side_padding = 1,
							scrollbar = false,
						},
						documentation = {},
					},
					formatting = {
						fields = { 'kind', 'abbr', 'menu' },
						format = require('lspkind').cmp_format({
							mode = 'symbol',
						}),
					},
					mapping = cmp.mapping.preset.insert({
						['<C-k>'] = cmp.mapping.select_prev_item(),
						['<C-j>'] = cmp.mapping.select_next_item(),
						['<C-b>'] = cmp.mapping.scroll_docs(-4),
						['<C-f>'] = cmp.mapping.scroll_docs(4),
						['<C-Space>'] = cmp.mapping.complete(),
						['<CR>'] = cmp.mapping.confirm({ select = false }),
					}),
					sources = cmp.config.sources({
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' },
						{ name = 'buffer' },
						{ name = 'path' },
					}),
				})

				cmp.setup.cmdline('/', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'buffer' },
					},
				})

				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = 'path' },
					}, {
						{
							name = 'cmdline',
							option = {
								ignore_cmds = { 'Man', '!' },
							},
						},
					}),
				})
			end,
		},
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
			callback = function(event)
				local builtin = require('telescope.builtin')

				require('which-key').register({
					['gd'] = { builtin.lsp_definitions, '[G]oto [D]efinition', mode = 'n', buffer = event.buf },
					['gr'] = { builtin.lsp_references, '[G]oto [R]eference', mode = 'n', buffer = event.buf },
					['gi'] = { builtin.lsp_implementations, '[G]oto [I]mplementation', mode = 'n', buffer = event.buf },
					['<leader>rn'] = { vim.lsp.buf.rename, '[R]e[n]ame', mode = 'n', buffer = event.buf },
					['<leader>ca'] = { vim.lsp.buf.code_action, '[C]ode [A]ction', mode = 'n', buffer = event.buf },
					['gD'] = { vim.lsp.buf.declaration, '[G]oto [D]eclaration', mode = 'n', buffer = event.buf },
				})

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
				},
			},
			pyright = {
				filetypes = { 'python' },
			},
			biome = {
				filetypes = { 'json' },
			},
		}

		require('mason').setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua',
			'luacheck',
			'black',
			'isort',
			'ruff',
			'mypy',
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
	end,
}
