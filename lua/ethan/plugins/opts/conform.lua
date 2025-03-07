return {
    notify_on_error = false,
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        tex = { 'latexindent' },
        css = { 'prettierd' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
}
