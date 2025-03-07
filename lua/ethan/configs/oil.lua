local M = {}

M.opts = {
    default_file_explorer = true,
    columns = {
        'icon',
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
            return vim.tbl_contains({ '.git', '.trash' }, name) or vim.endswith(name, 'cache')
        end,
    },
}

return M
