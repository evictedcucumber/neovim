local M = {}

M.setup = function()
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require('ufo').setup({
        ---@diagnostic disable: unused-local
        provider_selector = function(_bufnr, _filetype, _buftype)
            return { 'treesitter', 'indent' }
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
