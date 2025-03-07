local M = {}

M.setup = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local themes = require('telescope.themes')
    local transform_mod = require('telescope.actions.mt').transform_mod

    local trouble = require('trouble')
    local trouble_telescope = require('trouble.providers.telescope')

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
                    ['<C-t>'] = trouble_telescope.smart_open_with_trouble,
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

    vim.keymap.set('n', '<leader>sf', builtin.find_files)
    vim.keymap.set('n', '<leader>sk', builtin.keymaps)
    vim.keymap.set('n', '<leader>sg', builtin.live_grep)
    vim.keymap.set('n', '<leader>sc', builtin.grep_string)
    vim.keymap.set('n', '<leader>sh', builtin.help_tags)
    vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown())
    end)
    vim.keymap.set('n', '<leader>su', '<cmd>Telescope undo<CR>')
end

return M
