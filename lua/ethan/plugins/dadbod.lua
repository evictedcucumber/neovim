return {
    'tpope/vim-dadbod',
    dependencies = {
        'kristijanhusak/vim-dadbod-ui',
        'kristijanhusak/vim-dadbod-completion',
    },
    cmd = { 'DBUIToggle' },
    opts = true,
    config = require('ethan.plugins.config.dadbod'),
}
