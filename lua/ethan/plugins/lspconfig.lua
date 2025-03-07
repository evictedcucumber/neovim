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

                map(
                    '<leader>tt',
                    '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
                    'Toggle Trouble'
                )
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
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        ignore = { '*' },
                    },
                },
            },
        })

        lspconfig.ruff_lsp.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.hoverProvider = false
            end,
        })

        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.eslint.setup({
            capabilities = capabilities,
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
        })

        lspconfig.stylelint_lsp.setup({
            capabilities = capabilities,
        })

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            filetypes = { 'rust' },
            root_dir = require('lspconfig/util').root_pattern('Cargo.toml'),
        })

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
