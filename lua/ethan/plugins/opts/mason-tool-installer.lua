return {
    ensure_installed = {
        -- Formatters
        'stylua',
        'isort',
        'black',
        -- Linters
        'luacheck',
        'mypy',
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 5000,
}
