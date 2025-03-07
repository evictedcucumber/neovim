return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },
    },
    event = 'VeryLazy',
    opts = {
        ensure_installed = {
            -- LSPs
            'lua-language-server',
            'clangd',
            'cmake-language-server',
            -- Formatters
            'stylua',
            'clang-format',
            'cmakelang',
            -- Linters
            'luacheck',
            'cmakelint',
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 3000,
    },
}
