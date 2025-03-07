return {
    ensure_installed = {
        -- LSPs
        'eslint-lsp',
        'lua-language-server',
        'pyright',
        'ruff-lsp',
        'stylelint-lsp',
        'tailwindcss-language-server',
        'typescript-language-server',
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
}
