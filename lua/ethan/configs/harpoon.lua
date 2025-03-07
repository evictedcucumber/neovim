local M = {}

M.setup = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
    end, { desc = 'Harpoon [A]ppend' })

    vim.keymap.set('n', '<leader>e', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [E]xplorer' })

    vim.keymap.set('n', '<M-p>', function()
        harpoon:list():prev()
    end, { desc = 'Harpoon Goto [P]revious Item' })

    vim.keymap.set('n', '<M-n>', function()
        harpoon:list():next()
    end, { desc = 'Harpoon Goto [N]ext Item' })

    vim.keymap.set('n', '<M-h>', function()
        harpoon:list():select(1)
    end, { desc = 'Harpoon Goto Item One' })

    vim.keymap.set('n', '<M-j>', function()
        harpoon:list():select(2)
    end, { desc = 'Harpoon Goto Item Two' })

    vim.keymap.set('n', '<M-k>', function()
        harpoon:list():select(3)
    end, { desc = 'Harpoon Goto Item Three' })

    vim.keymap.set('n', '<M-l>', function()
        harpoon:list():select(4)
    end, { desc = 'Harpoon Goto Item Four' })
end

return M
