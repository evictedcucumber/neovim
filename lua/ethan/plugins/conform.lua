return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            cpp = { 'clang-format' },
            cmake = { 'cmake_format' },
        },
        format_on_save = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = 'fallback',
        },
    },
}
