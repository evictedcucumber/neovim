local M = {}

M.setup = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    require('which-key').register({
        a = {
            function()
                harpoon:list():add()
            end,
            'Harpoon Append',
        },
        e = {
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            'Harpoon Explorer',
        },
        ['1'] = {
            function()
                harpoon:list():select(1)
            end,
            'Harpoon Select Item One',
        },
        ['2'] = {
            function()
                harpoon:list():select(2)
            end,
            'Harpoon Select Item Two',
        },
        ['3'] = {
            function()
                harpoon:list():select(3)
            end,
            'Harpoon Select Item Three',
        },
        ['4'] = {
            function()
                harpoon:list():select(4)
            end,
            'Harpoon Select Item Four',
        },
    }, { prefix = '<leader>', mode = 'n' })

    require('which-key').register({
        ['<C-p>'] = {
            function()
                harpoon:list():prev()
            end,
            'Harpoon Goto Previous Item',
        },
        ['<C-n>'] = {
            function()
                harpoon:list():next()
            end,
            'Harpoon Goto Next Item',
        },
    }, { mode = 'n' })
end

return M
