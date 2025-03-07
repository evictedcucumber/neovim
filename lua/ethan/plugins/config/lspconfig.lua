return function()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = require('ethan.util').create_custom_augroup('lspconfig'),
        callback = function(event)
            local map = function(lhs, rhs, desc)
                vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = desc })
            end

            map('gd', '<cmd>Telescope lsp_definitions<CR>', 'Show LSP Definitions')
            map('gr', '<cmd>Telescope lsp_references<CR>', 'Goto References')

            map('<leader>rn', vim.lsp.buf.rename, 'Rename')
            map('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
            map('[d', vim.diagnostic.goto_prev, 'Goto Previous Diagnostic Message')
            map(']d', vim.diagnostic.goto_next, 'Goto Next Diagnostic Message')
            map('K', vim.lsp.buf.hover, 'Show Hover Documentation')

            map('<leader>tt', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', 'Toggle Trouble')
            map('<leader>tT', '<cmd>Trouble diagnostics toggle<CR>', 'Toggle Trouble')
            map('<leader>ts', '<cmd>Trouble symbols toggle<CR>', 'View Document Symbols')
            map('<leader>tx', '<cmd>Trouble close<CR>', 'Trouble Close')
            map(']t', '<cmd>Trouble next<CR>', 'Goto Next Trouble Item')
            map('[t', '<cmd>Trouble prev<CR>', 'Goto Previous Trouble Item')

            vim.keymap.set(
                'i',
                '<C-h>',
                vim.lsp.buf.signature_help,
                { buffer = event.buf, desc = 'Show Signature Help' }
            )

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
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
        end,
    })

    require('trouble').setup({})

    require('fidget').setup({
        notification = {
            window = {
                winblend = 0,
            },
        },
    })

    local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
    )

    local servers = {
        lua_ls = {
            filetypes = { 'lua' },
            options = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        },
        pyright = {
            filetypes = { 'python' },
        },
        ruff_lsp = {
            filetypes = { 'python' },
        },
    }

    require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
            function(server_name)
                local server_config = servers[server_name] or {}

                server_config.capabilities = capabilities
                require('lspconfig')[server_name].setup(server_config)
            end,
        },
    })

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.diagnostic.config({ underline = true })
end
