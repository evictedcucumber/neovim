return {
    notify_on_error = false,
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
}
