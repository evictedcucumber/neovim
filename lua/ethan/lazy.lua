local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'ethan.plugins' },
    { import = 'ethan.plugins.lsp' },
    { import = 'ethan.plugins.debug' },
}, {
    install = {
        missing = true,
        colorscheme = { 'catppuccin' },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
})

-- vim.api.nvim_create_autocmd('VimEnter', {
--     group = vim.api.nvim_create_augroup('lazyvim_autoupdate', { clear = true }),
--     callback = function()
--         if require('lazy.status').has_updates then
--             require('lazy').update({ show = false })
--         end
--     end,
-- })
