return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = 5 } } },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        auto_install = true,
        sync_install = true,
        ignore_install = {},
        ensure_installed = {
            'vim',
            'regex',
            'lua',
            'bash',
            'markdown',
            'markdown_inline',
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<C-space>',
                node_incremental = '<C-space>',
                scope_incremental = false,
                node_decremental = '<bs>',
            },
        },
    },
}
