vim.g.have_nerd_font = true

vim.g.python3_host_prog = '/home/ethan/.local/share/pyenv/versions/neovim-venv/bin/python'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = '100'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'

vim.opt.backspace = 'indent,eol,start'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false

vim.opt.mouse = 'a'

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 10

vim.opt.spelllang = 'en_gb'
vim.opt.spell = true

vim.opt.timeout = true
vim.opt.timeoutlen = 600

vim.api.nvim_create_autocmd('TextYankPost', {
    group = require('ethan.util').create_custom_augroup('highlight_yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})
