return {
    'akinsho/bufferline.nvim',
    after = 'catppuccin',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('bufferline').setup({
            highlights = require('catppuccin.groups.integrations.bufferline').get(),
            options = {
                diagnostics = 'nvim_lsp',
                show_close_icon = false,
                show_buffer_close_icons = false,
                always_show_bufferline = false,
                auto_toggle_bufferline = true,
                hover = {
                    enabled = false,
                },
            },
        })
    end,
}
