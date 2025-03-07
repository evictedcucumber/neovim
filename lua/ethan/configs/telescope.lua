local M = {}

M.setup = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local themes = require('telescope.themes')
    local transform_mod = require('telescope.actions.mt').transform_mod

    local trouble = require('trouble')
    local trouble_telescope = require('trouble.sources.telescope')

    local custom_actions = transform_mod({
        open_trouble_qflist = function()
            trouble.toggle('quickfix')
        end,
    })

    telescope.setup({
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = { width = 0.9 },
            },
            mappings = {
                i = {
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-q>'] = actions.send_selected_to_qflist
                        + custom_actions.open_trouble_qflist,
                    ['<C-t>'] = trouble_telescope.open,
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                find_command = {
                    'rg',
                    '--files',
                    '--hidden',
                    '--glob',
                    '!**/.git/*',
                    '--glob',
                    '!**/.trash/*',
                },
            },
        },
        extensions = {
            ['ui-select'] = {
                themes.get_dropdown(),
            },
        },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('undo')

    require('which-key').register({
        s = {
            name = 'search',
            f = { builtin.find_files, 'Find Files' },
            k = { builtin.keymaps, 'Search Keymaps' },
            g = { builtin.live_grep, 'Live Grep' },
            c = { builtin.grep_string, 'Grep String' },
            h = { builtin.help_tags, 'Search Help Tags' },
            u = { '<cmd>Telescope undo<CR>', 'Show Undo Tree' },
        },
        ['/'] = {
            function()
                builtin.current_buffer_fuzzy_find(themes.get_dropdown())
            end,
            'Fuzzy Search Buffer',
        },
    }, { prefix = '<leader>' })
end

return M
