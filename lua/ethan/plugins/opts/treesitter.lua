return {
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
        'python',
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
        'css',
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
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
}
