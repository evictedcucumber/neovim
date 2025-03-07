return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'nvim-neotest/nvim-nio',
		'rcarriga/nvim-dap-ui',
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',

		'mfussenegger/nvim-dap-python',
	},
	config = function()
		require('mason-nvim-dap').setup({
			automatic_installation = true,
			automatic_setup = true,
			ensure_installed = {
				'debugpy',
			},
		})

		local dap = require('dap')
		local dapui = require('dapui')

		dapui.setup({
			icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
			controls = {
				icons = {
					pause = '⏸',
					play = '▶',
					step_into = '⏎',
					step_over = '⏭',
					step_out = '⏮',
					step_back = 'b',
					run_last = '▶▶',
					terminate = '⏹',
					disconnect = '⏏',
				},
			},
		})

		require('which-key').register({
			['<leader>d'] = {
				name = '[D]ebug',
				b = {
					function()
						dap.toggle_breakpoint()
					end,
					'[D]ebug [B]reakpoint',
				},
				c = {
					function()
						dap.continue()
					end,
					'[D]ebug [C]ontinue',
				},
				i = {
					function()
						dap.step_into()
					end,
					'[D]ebug Step [I]nto',
				},
				o = {
					function()
						dap.step_over()
					end,
					'[D]ebug Step [O]ver',
				},
				O = {
					function()
						dap.step_out()
					end,
					'[D]ebug Step [O]ut',
				},
				u = {
					function()
						dapui.toggle()
					end,
					'Toggle [D]ebug [U]I',
				},
			},
		})

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		local dap_py = require('dap-python')
		dap_py.setup('/home/ethan/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
		dap_py.test_runner = 'pytest'
	end,
}
