return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            show_close_icon = false,
            show_buffer_close_icons = false,
            always_show_bufferline = false,
            auto_toggle_bufferline = true,
            hover = {
                enabled = false,
            },
            max_name_length = 15,
            max_prefix_length = 15,
            truncate_names = true,
            tab_size = 15,
        },
    },
}
