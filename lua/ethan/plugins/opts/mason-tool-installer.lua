return {
    ensure_installed = {
        -- Formatters
        'stylua',
        'isort',
        'black',
        'prettierd',
        -- Linters
        'luacheck',
        'mypy',
        'eslint_d',
        'stylelint',
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 5000,
}
