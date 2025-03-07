return {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd.colorscheme('tokyonight')
    end,
    opts = {
        style = 'night',
    },
}
