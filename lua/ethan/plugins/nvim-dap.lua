return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		{
			'mfussenegger/nvim-dap-python',
			ft = { 'python' },
			config = function()
				local dap_py = require('dap-python')
				dap_py.setup('/home/ethan/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
				dap_py.test_runner = 'pytest'
			end,
		},
		'jay-babu/mason-nvim-dap.nvim',
	},
	config = function()
		require('mason-nvim-dap').setup({
			automatic_installation = true,
		})

		local dap = require('dap')
		local dapui = require('dapui')

		vim.keymap.set('n', '<leader>db', function()
			dap.toggle_breakpoint()
		end, { desc = 'Toggle debug breakpoint' })

		vim.keymap.set('n', '<leader>dc', function()
			dap.continue()
		end, { desc = 'Debug continue' })

		vim.keymap.set('n', '<leader>dsi', function()
			dap.step_into()
		end, { desc = 'Debug step into' })

		vim.keymap.set('n', '<leader>dso', function()
			dap.step_over()
		end, { desc = 'Debug step over' })

		dapui.setup()

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close
	end,
}
