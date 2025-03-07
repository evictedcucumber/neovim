return function()
    require('oil').setup({
        default_file_explorer = true,
        columns = {
            'icon',
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return vim.tbl_contains({ '.git', '.trash', '.venv' }, name)
                    or string.find(name, 'cache')
            end,
            sort = {
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },
        use_default_keymaps = false,
        keymaps = {
            ['<CR>'] = 'actions.select',
        },
    })

    vim.keymap.set(
        'n',
        '<leader><tab>',
        '<cmd>Oil --float<CR>',
        { desc = 'Open Floating File Explorer' }
    )
    vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open File Explorer' })
end
