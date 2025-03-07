return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = {},
            lualine_y = { 'filetype' },
            lualine_z = { 'location' },
        },
    },
}
