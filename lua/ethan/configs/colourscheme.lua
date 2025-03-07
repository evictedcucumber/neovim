local M = {}

M.setup = function()
    require('catppuccin').setup({
        flavour = 'mocha',
        background = {
            light = 'mocha',
            dark = 'mocha',
        },
        transparent_background = true,
        show_end_of_buffer = true,
        term_colors = true,
        integrations = {
            markdown = true,
            fidget = true,
            cmp = true,
            treesitter = true,
            treesitter_context = true,
            harpoon = true,
            indent_blankline = {
                enabled = true,
                scope_color = 'text',
                colored_indent_levels = false,
            },
            mason = true,
            mini = {
                enabled = true,
                indendscope_color = 'text',
            },
            noice = true,
            dap = true,
            dap_ui = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                },
                inlay_hints = {
                    background = true,
                },
            },
            notify = true,
            telescope = true,
            which_key = true,
            lsp_trouble = true,
            gitsigns = true,
            flash = true,
        },
    })

    vim.cmd.colorscheme('catppuccin')

    local palette = require('catppuccin.palettes').get_palette('mocha')
    vim.cmd('highlight SpellBad guisp=' .. palette.sky)
    vim.cmd('highlight SpellCap guisp=' .. palette.blue)
    vim.cmd('highlight SpellRare guisp=' .. palette.teal)
    vim.cmd('highlight SpellLocal guisp=' .. palette.mantle)
end

return M
