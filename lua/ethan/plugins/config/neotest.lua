return function()
    local neotest = require('neotest')
    ---@diagnostic disable-next-line: missing-fields
    neotest.setup({
        adapters = {
            require('neotest-python'),
        },
    })

    vim.keymap.set('n', '<leader>ntr', neotest.run.run, { desc = 'Neotest Run Closest Test' })
    vim.keymap.set('n', '<leader>ntR', function()
        neotest.run.run(vim.fn.expand('%'))
    end, { desc = 'Neotest Run All Tests' })
    vim.keymap.set('n', '<leader>ntk', neotest.run.stop, { desc = 'Neotest Stop Test' })
end
