return function()
    require('nvim-autopairs').setup()

    local cmp = require('cmp')
    cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done)
end
