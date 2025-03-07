return {
    'NvChad/nvim-colorizer.lua',
    ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css' },
    opts = {
        filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css' },
        user_default_options = {
            css = true,
            css_fn = true,
            tailwind = true,
            mode = 'foreground',
            always_update = false,
        },
        buftypes = {
            '*',
            '!prompt',
            '!popup',
        },
    },
}
