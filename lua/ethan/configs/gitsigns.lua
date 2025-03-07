local M = {}

M.opts = {
    signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
    },
}

M.setup = function(_, opts)
    require('gitsigns').setup(opts)
end

return M
