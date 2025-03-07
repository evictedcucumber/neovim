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

		require('which-key').register({
			['<leader>d'] = {
				name = '[D]ebug',
				b = { dap.toggle_breakpoint(), '[D]ebug [B]reakpoint' },
				c = { dap.continue(), '[D]ebug [C]ontinue' },
				i = { dap.step_into(), '[D]ebug Step [I]nto' },
				o = { dap.step_over(), '[D]ebug Step [O]ver' },
				O = { dap.step_out(), '[D]ebug Step [O]ut' },
				u = { dapui.toggle(), 'Toggle [D]ebug [U]I' },
			},
		})

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

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		local dap_py = require('dap-python')
		dap_py.setup('/home/ethan/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
		dap_py.test_runner = 'pytest'
	end,
}
