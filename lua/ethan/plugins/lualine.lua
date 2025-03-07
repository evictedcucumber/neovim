return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'nord',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = {
                {
                    require('noice').api.statusline.mode.get,
                    cond = require('noice').api.statusline.mode.has,
                },
            },
            lualine_y = { 'filetype' },
            lualine_z = { 'location' },
        },
    },
}
