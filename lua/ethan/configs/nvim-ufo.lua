local M = {}

M.setup = function()
    vim.opt.foldcolumn = '0'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    require('ufo').setup({
        ---@diagnostic disable: unused-local
        provider_selector = function(_bufnr, _filetype, _buftype)
            return { 'lsp', 'indent' }
        end,
    })

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'K', function()
        if not require('ufo').peekFoldedLinesUnderCursor() then
            vim.lsp.buf.hover()
        end
    end)
end

return M
