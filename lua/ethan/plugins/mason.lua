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
            'eslint-lsp',
            'lua-language-server',
            'pyright',
            'ruff-lsp',
            'stylelint-lsp',
            'tailwindcss-language-server',
            'typescript-language-server',
            'rust-analyzer',
            -- Formatters
            'prettierd',
            'stylua',
            -- Linters
            'luacheck',
            'mypy',
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 3000,
    },
}
