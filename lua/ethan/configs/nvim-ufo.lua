local M = {}

M.setup = function()
    vim.opt.foldcolumn = '0'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    local ufo = require('ufo')

    ufo.setup({
        ---@diagnostic disable: unused-local
        provider_selector = function(_bufnr, _filetype, _buftype)
            return { 'lsp', 'indent' }
        end,
    })

    require('which-key').register({
        z = {
            R = { ufo.openAllFolds, 'Open All Folds' },
            M = { ufo.closeAllFolds, 'Close All Folds' },
        },
        K = {
            function()
                if not ufo.peekFoldedLinesUnderCursor() then
                    vim.lsp.buf.hover()
                end
            end,
            'View Hover Documentation',
        },
    }, { mode = 'n' })
end

return M
