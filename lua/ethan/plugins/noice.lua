return {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
    opts = {
        cmdline = {
            view = 'cmdline',
            format = { search_down = { view = 'cmdline' }, search_up = { view = 'cmdline' } },
        },
        routes = {
            {
                filter = { event = 'notify', find = 'No information available' },
                opts = { skip = true },
            },
            {
                filter = { event = 'msg_show', kind = '', find = 'written' },
                opts = { skip = true },
            },
        },
        notify = { enabled = true, view = 'mini' },
        lsp = {
            progress = { enabled = false },
            hover = { enabled = true, silent = true },
            message = { enabled = true, view = 'mini' },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
        },
        messages = { enabled = true, view = 'mini', view_error = 'mini', view_warn = 'mini' },
    },
}
