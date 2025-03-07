return {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    opts = {
        style = 'night',
        on_highlights = function(hl, c)
            hl.SpellBad = {
                sp = c.blue0,
                undercurl = true,
            }
            hl.SpellCap = {
                sp = c.blue0,
                undercurl = true,
            }
            hl.SpellRare = {
                sp = c.blue0,
                undercurl = true,
            }
            hl.SpellLocal = {
                sp = c.blue0,
                undercurl = true,
            }
        end,
    },
}
