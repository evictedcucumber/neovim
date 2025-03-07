return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                ['_'] = { 'trim_whitespace' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })
    end,
}
