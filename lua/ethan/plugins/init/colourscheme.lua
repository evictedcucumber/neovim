return function()
    vim.cmd.colorscheme('catppuccin')

    local palette = require('catppuccin.palettes').get_palette('mocha')
    vim.cmd('highlight SpellBad guisp=' .. palette.sky)
    vim.cmd('highlight SpellCap guisp=' .. palette.blue)
    vim.cmd('highlight SpellRare guisp=' .. palette.teal)
    vim.cmd('highlight SpellLocal guisp=' .. palette.mantle)
end
