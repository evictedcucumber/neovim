return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
    },
    event = 'VimEnter',
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local themes = require('telescope.themes')

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
                spell_suggest = {
                    theme = 'cursor',
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                ['ui-select'] = {
                    themes.get_dropdown(),
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')

        -- KEYMAPS
        local builtins = require('telescope.builtin')

        local function is_git_repo()
            vim.fn.system('git rev-parse --is-inside-work-tree')
            return vim.v.shell_error == 0
        end

        local function get_git_cwd()
            local cwd = vim.fn.system('git rev-parse --show-toplevel')
            return vim.fn.trim(cwd, '\n', 2)
        end

        local function find_files_from_project_git_root()
            local opts = {}
            if is_git_repo() then
                opts = {
                    cwd = get_git_cwd(),
                }
            end
            builtins.find_files(opts)
        end

        local function live_grep_from_project_git_root()
            local opts = {}
            if is_git_repo() then
                opts = {
                    cwd = get_git_cwd(),
                }
            end
            builtins.live_grep(opts)
        end

        vim.keymap.set('n', '<leader>sf', find_files_from_project_git_root, { desc = 'Find Files' })
        vim.keymap.set('n', '<leader>sg', live_grep_from_project_git_root, { desc = 'Live Grep' })
        vim.keymap.set('n', '<leader>ss', builtins.spell_suggest, { desc = 'Spell Suggest' })
        vim.keymap.set('n', '<leader>sk', builtins.keymaps, { desc = 'Search Keymaps' })
        vim.keymap.set('n', '<leader>sb', builtins.buffers, { desc = 'Search Buffers' })
        vim.keymap.set(
            'n',
            '<leader>/',
            builtins.current_buffer_fuzzy_find,
            { desc = 'Fuzzy Search Buffer' }
        )
    end,
}
