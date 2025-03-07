local M = {}

M.setup = function()
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

	vim.keymap.set('n', '<leader>db', function()
		dap.toggle_breakpoint()
	end, { desc = '[D]ebug Toggle [B]reakpoint' })

	vim.keymap.set('n', '<leader>dc', function()
		dap.continue()
	end, { desc = '[D]ebug [C]ontinue' })

	vim.keymap.set('n', '<leader>di', function()
		dap.step_into()
	end, { desc = '[D]ebug Step [I]nto' })

	vim.keymap.set('n', '<leader>do', function()
		dap.step_over()
	end, { desc = '[D]ebug Step [O]ver' })

	vim.keymap.set('n', '<leader>dO', function()
		dap.step_out()
	end, { desc = '[D]ebug Step [O]ut' })

	vim.keymap.set('n', '<leader>du', function()
		dapui.toggle()
	end, { desc = '[D]ebug Toggle [U]I' })

	dap.listeners.after.event_initialized['dapui_config'] = dapui.open
	dap.listeners.before.event_terminated['dapui_config'] = dapui.close
	dap.listeners.before.event_exited['dapui_config'] = dapui.close
end

M.setup_python = function()
	local dap_py = require('dap-python')
	dap_py.setup('/home/ethan/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
	dap_py.test_runner = 'pytest'
end

return M
