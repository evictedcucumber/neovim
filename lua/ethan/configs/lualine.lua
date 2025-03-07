local M = {}

M.setup = function()
    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = {
                function()
                    if require('lazy.status').has_updates() then
                        return '󰒲 󰚰 '
                    else
                        return ''
                    end
                end,
            },
            lualine_y = { 'filetype' },
            lualine_z = { 'location' },
        },
    })
end

return M
