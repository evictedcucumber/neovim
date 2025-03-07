return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
        'hrsh7th/cmp-nvim-lsp',
        'j-hui/fidget.nvim',
        {
            'folke/neodev.nvim',
            opts = { library = { plugins = { 'neotest' }, types = true } },
        },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = require('ethan.util').create_custom_augroup('lsp_attach'),
            callback = function(event)
                local function opts(desc)
                    return { buffer = event.buf, desc = desc }
                end

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('Go to definition'))
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts('Go to implementation'))
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('Go to references'))
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts('Rename'))
                vim.keymap.set(
                    { 'n', 'v' },
                    '<leader>ca',
                    vim.lsp.buf.code_action,
                    opts('Code Actions')
                )
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('Show Hover Documentation'))
                vim.keymap.set(
                    'i',
                    '<C-h>',
                    vim.lsp.buf.signature_help,
                    opts('Show Signature Help')
                )

                vim.keymap.set(
                    'n',
                    '<leader>tt',
                    '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
                    opts('Toggle Trouble')
                )
                vim.keymap.set(
                    'n',
                    '<leader>tT',
                    '<cmd>Trouble diagnostics toggle<CR>',
                    opts('Toggle Trouble')
                )
                vim.keymap.set(
                    'n',
                    '<leader>ts',
                    '<cmd>Trouble symbols toggle<CR>',
                    opts('View Document Symbols')
                )
                vim.keymap.set('n', '<leader>tx', '<cmd>Trouble close<CR>', opts('Trouble Close'))
                vim.keymap.set('n', ']t', '<cmd>Trouble next<CR>', opts('Goto Next Trouble Item'))
                vim.keymap.set(
                    'n',
                    '[t',
                    '<cmd>Trouble prev<CR>',
                    opts('Goto Previous Trouble Item')
                )

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                if not client then
                    return
                end

                if client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        group = require('ethan.util').create_custom_augroup('document_highlight'),
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        group = require('ethan.util').create_custom_augroup('clear_references'),
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
                end

                if client.server_capabilities.codeLensProvider then
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
                        group = require('ethan.util').create_custom_augroup('codelens_refresh'),
                        buffer = event.buf,
                        callback = vim.lsp.codelens.refresh,
                    })
                end
            end,
        })

        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require('cmp_nvim_lsp').default_capabilities()
        )

        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    codeLens = {
                        enable = true,
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    doc = {
                        privateName = { '^_' },
                    },
                    hint = {
                        enable = true,
                        setType = false,
                        paramType = true,
                        paramName = 'Disable',
                        semicolon = 'Disable',
                        arrayIndex = 'Disable',
                    },
                },
            },
        })

        lspconfig.clangd.setup({
            capabilities = {
                offsetEncoding = { 'utf-16' },
            },
            cmd = {
                'clangd',
                '--background-index',
                '--clang-tidy',
                '--header-insertion=iwyu',
                '--completion-style=detailed',
                '--function-arg-placeholders',
                '--fallback-style=llvm',
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        })

        lspconfig.cmake.setup({ capabilities = capabilities })

        require('trouble').setup({})

        require('fidget').setup({
            progress = {
                ignore_done_already = true,
                ignore_empty_message = true,
            },
            notification = {
                window = {
                    winblend = 0,
                },
            },
        })

        local signs = { Error = '', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        vim.diagnostic.config({ underline = true })
    end,
}
