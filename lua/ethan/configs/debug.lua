local M = {}

M.setup = function()
    ---@diagnostic disable: missing-fields
    require('mason-nvim-dap').setup({
        automatic_setup = true,
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
        B = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
        d = {
            name = 'debug',
            c = { dap.continue, 'Debug Continue' },
            i = { dap.step_into, 'Debug Step Into' },
            o = { dap.step_over, 'Debug Step Over' },
            O = { dap.step_out, 'Debug Step Out' },
            u = { dapui.toggle, 'Debug UI Toggle' },
        },
    })

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
