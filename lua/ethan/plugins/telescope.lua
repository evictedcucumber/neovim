return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'debugloop/telescope-undo.nvim',
    },
    keys = {
        { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = 'Find Files' },
        { '<leader>sk', '<cmd>Telescope keymaps<CR>', desc = 'Search Keymaps' },
        { '<leader>sg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
        { '<leader>sc', '<cmd>Telescope grep_string<CR>', desc = 'Grep String' },
        { '<leader>sh', '<cmd>Telescope help_tags<CR>', desc = 'Find Help Tags' },
        { '<leader>su', '<cmd>Telescope undo<CR>', desc = 'Show Undo Tree' },
        { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find', desc = 'Fuzzy Search Buffer' },
    },
    config = function()
        local telescope = require('telescope')
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
                        '--glob',
                        '!**/*.db',
                        '--glob',
                        '!**/.venv/*',
                        '--glob',
                        '!**/*cache*',
                        '--glob',
                        '!**/*.lock',
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
    end,
}
