local M = {}

M.setup = function()
    require('mason').setup({
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
        },
    })

    require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(require('ethan.configs.nvim-lspconfig').servers or {}),
    })

    local tools = vim.tbl_deep_extend(
        'force',
        {},
        require('ethan.configs.conform').formatters or {},
        require('ethan.configs.nvim-lint').linters or {},
        require('ethan.configs.debug').debuggers or {}
    )

    require('mason-tool-installer').setup({
        ensure_installed = tools,
        auto_update = false,
        run_on_start = true,
        start_delay = 5000,
    })
end

return M
