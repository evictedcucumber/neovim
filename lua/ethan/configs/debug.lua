local M = {}

M.setup = function()
    ---@diagnostic disable-next-line: missing-fields
    require('mason-nvim-dap').setup({
        automatic_setup = true,
    })

    local dap = require('dap')
    local dapui = require('dapui')

    ---@diagnostic disable-next-line: missing-fields
    dapui.setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        ---@diagnostic disable-next-line: missing-fields
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

    vim.keymap.set('n', '<leader>B', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug Continue' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug Step Into' })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug Step Over' })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Debug Step Out' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug UI Toggle' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
end

M.debuggers = {
    'debugpy',
}

M.setup_python = function()
    local dap_py = require('dap-python')
    dap_py.setup('/home/ethan/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
    dap_py.test_runner = 'pytest'
end

return M
