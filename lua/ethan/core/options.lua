vim.opt.relativenumber = true
vim.opt.number = true

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

vim.opt.clipboard:append('unnamedplus')

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false

vim.opt.mouse = 'a'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('ethan-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
