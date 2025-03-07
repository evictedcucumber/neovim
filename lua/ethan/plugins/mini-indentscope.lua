return {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('mini.indentscope').setup({ symbol = '┃' })

        vim.cmd([[highlight MiniIndentScopeSymbol guifg=#3b4261]])
    end,
}
