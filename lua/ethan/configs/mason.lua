local M = {}

M.opts = {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
}

local tools = {}
vim.list_extend(tools, require('ethan.configs.conform').formatters or {})
vim.list_extend(tools, require('ethan.configs.nvim-lint').linters or {})

M.setup = function(_, opts)
    require('mason').setup(opts)

    require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(require('ethan.configs.nvim-lspconfig').servers or {}),
    })

    require('mason-tool-installer').setup({
        ensure_installed = tools,
        auto_update = true,
        run_on_start = true,
        start_delay = 5000,
    })
end

return M
