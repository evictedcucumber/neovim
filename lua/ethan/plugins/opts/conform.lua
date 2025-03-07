return {
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
